class PaymentsController < ApplicationController

	before_action :authenticate_user!

  def new
    @payment = Payment.new
    @address = current_user.addresses.first
    @payment.user_id = current_user.id
    @carts = current_user.carts
    @total_price = 0
    @carts.each do |cart|
      @total_price += (cart.product.price * 1.08).floor * cart.quantity
    end
    @purchase_product = @payment.purchase_products.build
  end

  def create
    # @payment_method = PaymentMethod.find(params[:payment_method_id])
    # @payment.payment_method_id = @payment_method.id

    @payment = Payment.new(payment_params)
    @payment.user_id = current_user.id

    if @payment.save
      @payment.user.carts.each do |cart|
        purchase_product = PurchaseProduct.new
        purchase_product.product_id = cart.product.id
        purchase_product.quantity = cart.quantity
        purchase_product.price = (cart.product.price * 1.08).floor
        purchase_product.payment_id = @payment.id
        purchase_product.save
      end
      @payment.user.carts.destroy_all
      redirect_to finish_path
    else
      @payment.user_id = current_user.id
      @address = current_user.addresses.first
      @carts = current_user.carts
      @total_price = 0
      @carts.each do |cart|
        @total_price += (cart.product.price * 1.08).floor * cart.quantity
      end
      @purchase_product = @payment.purchase_products.build
      render :new
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
  	params.require(:payment).permit(
      :user,
      :payment_method_id,
      :shipping_last_name,
      :shipping_first_name,
      :shipping_postal_code,
      :shipping_address,
      :order_status,
      purchase_products_attributes: [:id, :quantity, :price, :payment_id]
      )
  end
end
