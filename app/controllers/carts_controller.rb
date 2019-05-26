class CartsController < ApplicationController
  before_action :authenticate_user!

  def create
    # カートの中身を登録 商品詳細ページでカートに入れるボタンを押したら「カートに商品を追加しました」と表示させてそのページに留まる
    @cart = Cart.new(cart_params)
    @cart.user_id = current_user.id
    if @cart.save
      redirect_to product_path(@product.id), notice: "カートに追加しました！"
    end
  end

  def update
    # カートに入っているある商品の個数が変更されたら更新
    cart = Cart.find(params[:id])
    if cart.update(cart_params)
      redirect_to user_cart_path(current_user.id), notice: "変更しました！"
    else
      @carts = Cart.all
      render "users/cart"
    end
  end

  def destroy
    # カートに入っているある商品idを持ったもののみを削除 決済画面へ遷移したらカートの中身を全て削除
    cart = Cart.find(params[:id])
    cart.destroy
    redirect_to user_cart_path(current_user.id), notice: "削除しました！"
  end

private

  def cart_params
    params.require(:cart).permit(:product_id, :user_id, :quantity)
  end

end
