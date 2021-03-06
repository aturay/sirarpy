# config valid for current version and patch releases of Capistrano
lock "~> 3.10.2"

set :repo_url,        'git@github.com:aturay/sirarpy.git'
set :application,     'sirarpy_production'
set :user,            'sirarpy'
set :puma_threads,    [4, 16]
set :puma_workers,    0

# Don't change these unless you know what you're doing
set :pty,             true
set :use_sudo,        false
set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
set :rvm_custom_path, '/usr/share/rvm'

set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, false  # Change to true if using ActiveRecord

## Defaults:
# set :scm,           :git
# set :branch,        :master
# set :format,        :pretty
# set :log_level,     :debug
# set :keep_releases, 5
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

## Linked Files & Directories (Default None):
set :linked_files, %w{config/database.yml config/secrets.yml .env}
set :linked_dirs,  %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts "WARNING: HEAD is not the same as origin/master"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end

  desc 'Upload configuration fiiles from local disk'
  task :upload_config_files do
    on roles(:app) do
      execute :mkdir, '-p', shared_path
      upload! 'config/database.yml', "#{shared_path}/config"
      upload! 'config/secrets.yml',  "#{shared_path}/config"
      upload! '.env',                "#{shared_path}"
    end
  end

  desc 'Resset database'
  task :resset do
    on roles(:db) do
      within release_path do
        with rails_env: fetch(:stage) do
          # execute :rake, 'db:schema:load'
          execute :rake, 'db:drop DISABLE_DATABASE_ENVIRONMENT_CHECK=1'
          execute :rake, 'db:create'
          execute :rake, 'db:migrate'
          execute :rake, 'assets:precompile'
          execute :rake, 'db:seed'
        end
      end
    end
  end

  before :starting, :check_revision
end

# ps aux | grep puma    # Get puma pid
# kill -s SIGUSR2 pid   # Restart puma
# kill -s SIGTERM pid   # Stop puma
