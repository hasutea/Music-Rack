class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).reverse_order

    # (params[:q])に検索パラメーターが入り、Productテーブルを検索する@qオブジェクトを生成
    @q = Product.ransack(params[:q])
    # 検索結果を表示
    @results = @q.result
  end

  def show
    @product = Product.find(params[:id])
  end

private
  def product_params
    params.require(:product).permit(:title, :artist, :genre, :image, :price, :disk, :stock, :status)
end

end
