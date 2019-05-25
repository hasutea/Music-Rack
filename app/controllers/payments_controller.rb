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

  def index
    @payments = current_user.payments.page(params[:page]).reverse_order
  end

  def show
    @payment = Payment.find(params[:id])
    @purchase_products = @payment.purchase_products
  end

  def finish
  end

private
  def payment_params
  	params.require(:payment).permit(:user, :payment_method, :shipping_last_name, :shipping_first_name, :shipping_postal_code, :shipping_address, :order_status)
  end
end
