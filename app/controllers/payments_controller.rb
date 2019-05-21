class PaymentsController < ApplicationController
  def new
  end

  def create
  end

  def index
    # @payments = Payment.all
    # @payment = @payments.where(user: current_user)
    # @purchase_products = @payment.purchase_products.all
    
  end

  def finish
  end

private
  def payment_params
  	params.require(:payment).permit(:user, :payment_method, :shipping_last_name, :shipping_first_name, :shipping_postal_code, :shipping_address, :order_status)
  end
end
