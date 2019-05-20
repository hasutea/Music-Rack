class CartsController < ApplicationController
  before_action :authenticate_user!, :validate_cart!

  def show
    # カートに入れるボタンを押された商品全てを表示(カートテーブルの商品id,ユーザーid,数量を取得して表示)
    @cart = current_user.cart
    @carts = Cart.all

    # カート内に商品がなかったら、商品がないと表示
  end

  def create
    # カートの中身を登録する カートに入れるボタンを押したら「カートに商品を追加しました」と表示させてそのページに留まる
    cart = current_user.cart
    cart = Cart.new(cart_params)
    if cart.save
      redirect_to cart_path(@cart)
    else
      render :show
    end
  end

  def update
    # カートに入っているある商品の個数が変更されたら更新
    @cart = Cart.find(params[:product_id])
    if @cart.update(cart_params)
      redirect_to cart_path(@cart)
    else
      render :show
    end
  end

  def destroy
    # カートに入っているある商品idを持ったもののみを削除
    cart = current_user.cart
    cart_content = Cart.find(params[:product_id])
    cart_content.destroy
    redirect_to cart
  end

  private

  def cart_params
    params.require(:cart).permit(:product_id, :user_id, :quantity)
  end

end
