class CartsController < ApplicationController
  before_action :authenticate_user!, :validate_cart!
  helper_method :current_cart

  def show
    # カートに入れるボタンを押された商品全てを表示(カートテーブルの商品id,ユーザーid,数量を取得して表示)
    @carts = current_cart.cart
    if session[:cart]
      @cart = Cart.find(session [:cart])
    else
      @cart = Cart.create
      session[:cart] = @cart.id
    # カート内に商品がなかったら、商品がないと表示
    end
  end

  def create
    # カートの中身を登録 商品詳細ページでカートに入れるボタンを押したら「カートに商品を追加しました」と表示させてそのページに留まる
    session[:cart] = [] unless session[:cart]
    session[:cart] << params[:item_id]
    flash[:success] = "カートに追加しました！"
    redirect_to products_path
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
    # カートに入っているある商品idを持ったもののみを削除 決済画面へ遷移したらカートの中身を全て削除
    cart = current_user.cart
    cart_content = Cart.find(params[:product_id])
    cart_content.destroy
    redirect_to cart
  end

  private

  def cart_params
    params.require(:cart).permit(:product_id, :user_id, :quantity)
  end

  def validate_cart!
    @cart = current_user.cart
    @params_cart = Cart.find(params[:id])
  end

end
