class Admins::PaymentsController < ApplicationController

	before_action :authenticate_admin!

  layout "admin"

  def index
  	@users = User.all
    @payments = current_user.payments.page(params[:page]).reverse_order
  end

  def show
    @payment = Payment.find(params[:id])
    @purchase_products = @payment.purchase_products
  end

  def edit
  	@payment = Payment.find(params[:id])
    @purchase_products = @payment.purchase_products
  end


  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy
    flash[:success] = '購入履歴が削除されました。'
    redirect_to admins_payments_path
  end

private
  def payment_params
  	params.require(:payment).permit(:user, :payment_method_id, :shipping_last_name, :shipping_first_name, :shipping_postal_code, :shipping_address, :order_status, purchase_products_attributes: [:id, :quantity, :price])
  end
end
