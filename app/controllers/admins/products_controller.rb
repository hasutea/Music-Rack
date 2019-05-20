class Admins::ProductsController < ApplicationController

  layout "admin"

  def index
    @products = Product.page(params[:page]).reverse_order

    # (params[:q])に検索パラメーターが入り、Productテーブルを検索する@searchオブジェクトを生成
    @search = Product.ransack(params[:q])
    # 検索結果を表示
    @results = @search.result

  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def new
  end

  def create
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admins_products_path(@product)
    else
      render :edit
    end
  end

  def destroy
  end

private
  def product_params
    params.require(:product).permit(:title, :artist, :genre, :image, :price, :disk, :stock, :status,)
  end
end
