class MessagesController < ActionController::Base

  def create
    message = Message.new message_params
    message.customer = Customer.find_or_create customer_params
    message.save

    render json: { message: message.errors.messages }, status: 200
  end

  private
  def message_params
    params.require(:message).permit(:message)
  end

  def customer_params
    params.require(:customer).permit(:fullname, :email)
  end
end
