class MessagesController < ActionController::Base

  def create
    message = Message.new message_params
    message.customer = Customer.find_or_create customer_params

    if message.save
      MessagesMailer.sample_email(message).deliver
      render json: { success: true, message: '<strong>Well done!</strong>Your message has been sent.' }, status: 200
    else
      render json: { success: false, message: 'There was an error.' }, status: 505
    end
  end

  private
  def message_params
    params.require(:message).permit(:message)
  end

  def customer_params
    params.require(:customer).permit(:fullname, :email)
  end
end
