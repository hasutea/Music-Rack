class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).reverse_order

    # 検索値を検索するインスタンス変数
    @query = Product.ransack(params[:q])
    # 検索結果を表示するインスタンス変数
    @products = @query.paginate(page: params[:page], per_page: 20)
  end

  def show
    @product = Product.find(params[:id])
  end

private
  def product_params
    params.require(:product).permit(:title, :artist, :genre, :image, :price, :disk, :stock, :status)
end

end
