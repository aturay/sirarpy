class MessagesMailer < ApplicationMailer
  def sample_email(message)
    @message = message
    mail from: message.customer.email,
         subject: "sirarpy.com (Contact Us)[#{message.customer.fullname}]"
  end
end
