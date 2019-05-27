class Admins::PaymentsController < ApplicationController

	before_action :authenticate_admin!

  layout "admin"

  def index
  	@users = User.all

    # (params[:q])に検索パラメーターが入り、Productテーブルを検索する@qオブジェクトを生成
    @search_user = User.ransack(params[:q])
    # 検索結果を表示
    @results_user = @search_user.result.page(params[:page]).reverse_order.per(20)
  end

  def show
    @payment = Payment.find(params[:id])
    @purchase_products = @payment.purchase_products
  end

  def edit
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

  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy
    flash[:success] = '購入履歴が削除されました。'
    redirect_to admins_payments_path
  end

private
  def payment_params
  	params.require(:payment).permit(:user_id, :payment_method_id, :shipping_last_name, :shipping_first_name, :shipping_postal_code, :shipping_address, :order_status, purchase_products_attributes: [:id, :quantity, :price])
  end
end
