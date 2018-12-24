class ApplicationMailer < ActionMailer::Base
  default from: 'site@sirarpy.com',
          to: 'sira1210@gmail.com',
          cc: 'avchyanatur@gmail.com'
  layout 'mailer'
end
