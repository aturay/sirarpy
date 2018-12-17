class SubscribesController < ApplicationController

  def subscribe
    customer = Customer.find_or_create(customer_params)
    render json: {message: customer.errors.message}, status: 200
  end

  private
  def customer_params
    params.require(:customer).permit(:email)
  end
end
