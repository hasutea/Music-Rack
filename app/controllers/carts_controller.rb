class CartsController < ApplicationController
  before_action :authenticate_user!

  def create
    # カートの中身を登録 商品詳細ページでカートに入れるボタンを押したら「カートに商品を追加しました」と表示させてそのページに留まる
    @cart = Cart.new(cart_params)
    @cart.user_id = current_user.id

    if Cart.exists?(product_id: @cart.product_id)
      @cart_update = Cart.find_by(product_id: @cart.product_id)
      @cart_update.quantity = @cart_update.quantity + @cart.quantity
      @cart_update.save
      flash[:info] = 'カートに追加しました！'
      redirect_to product_path(@cart.product.id)
    else
      @cart.save
      flash[:info] = 'カートに追加しました！'
      redirect_to product_path(@cart.product.id)
    end
  end

  def update
    # カートに入っているある商品の個数が変更されたら更新
    cart = Cart.find(params[:id])
    if cart.update(cart_params)
      flash[:success] = '変更しました！'
      redirect_to user_cart_path(current_user.id)
    else
      @carts = Cart.all
      render "users/cart"
    end
  end

  def destroy
    # カートに入っているある商品idを持ったもののみを削除 決済画面へ遷移したらカートの中身を全て削除
    cart = Cart.find(params[:id])
    cart.destroy
    flash[:danger] = '削除しました！'
    redirect_to user_cart_path(current_user.id)
  end

private

  def cart_params
    params.require(:cart).permit(:product_id, :user_id, :quantity)
  end

end
