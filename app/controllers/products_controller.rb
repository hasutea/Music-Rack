class ProductsController < ApplicationController

  before_action :authenticate_user!, except: [:index,:show,]

  def index
    @products = Product.page(params[:page]).reverse_order

    # (params[:q])に検索パラメーターが入り、Productテーブルを検索する@qオブジェクトを生成
    @search = Product.ransack(params[:q])
    # 検索結果を表示
    @results = @search.result
  end

  def show
    @product = Product.find(params[:id])
    @disks = @product.disks
  end

private
  def product_params
  params.require(:product).permit(
    :title,
    :image,
    :price,
    :stock,
    :status,
    :artist_id,
    :label_id,
    :genre_id,
    disks_attributes: [:id, :disk, :product_id, :_destroy],
    songs_attributes: [:id, :disk_id, :song_title, :song_order, :_destroy]
    )
  end
end
