class PaymentsController < ApplicationController

	before_action :authenticate_user!

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    if @payment.save
      redirect_to finish_path
    end
  end

  def show
  end

  def finish
  end

private
  def payment_params
    params.require(:payment).permit(:shipping_last_name, :shipping_first_name, :shipping_postal_code, :shipping_address, :order_status, :payment_method_id, :user_id, purchase_products_attributes: [:id, :product_id, :quantity, :price])
  end
end
