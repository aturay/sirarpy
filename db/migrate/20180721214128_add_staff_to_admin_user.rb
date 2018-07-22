class AddStaffToAdminUser < ActiveRecord::Migration[5.1]
  def change
    add_column :admin_users, :staff, :boolean, default: 0
  end
end
