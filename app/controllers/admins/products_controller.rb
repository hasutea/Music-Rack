class Admins::ProductsController < ApplicationController

  before_action :authenticate_admin!

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
    @disks = @product.disks
  end

  def new
    @product = Product.new
    @disk = @product.disks.build
    @song = @disk.songs.build
  end

  def create
    @product = Product.new(product_params)

    @artist = Artist.find(params[:artist_id])
    @product.artist_id = @artist.id

    @label = Label.find(params[:label_id])
    @product.label_id = @label.id

    @genre = Genre.find(params[:genre_id])
    @product.genre_id = @genre.id

    if @product.save
      redirect_to admins_products_path, notice: "商品を新規登録しました！"
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admins_products_path, notice: "商品情報を更新しました！"
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admins_products_path
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
    disks_attributes: [
      :id,
      :disk,
      :product_id,
      :_destroy,
      songs_attributes: [:id, :disk_id, :song_title, :song_order, :_destroy]
    ]
    )
  end
end
