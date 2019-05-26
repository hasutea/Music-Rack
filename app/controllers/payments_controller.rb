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

  def update
    @payment = Payment.find(params[:id])

    # @payment_method = Payment_method.find(params[:payment_method_id])
    # @payment.payment_method_id = @payment_method.id

    if @payment.update(payment_params)
    flash[:success] = '変更内容が保存されました。'
    redirect_to admins_payments_path
    else
      render :edit
    end
  end



  def finish
  end

private
  def payment_params
  	params.require(:payment).permit(:user, :payment_method_id, :shipping_last_name, :shipping_first_name, :shipping_postal_code, :shipping_address, :order_status, purchase_products_attributes: [:id, :quantity, :price])
  end
end
