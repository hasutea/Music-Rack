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
    @quantity = [["0", "0"],
                  ["1", "1"],
                  ["2", "2"],
                  ["3", "3"],
                  ["4", "4"],
                  ["5", "5"],
                  ["6", "6"],
                  ["7", "7"],
                  ["8", "8"],
                  ["9", "9"],
                  ["10", "10"]]
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

end
