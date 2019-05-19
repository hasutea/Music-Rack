class ProductsController < ApplicationController
  def index
  	@products = Product.page(params[:page]).reverse_order
  end

  def show
    @product = Product.find(params[:id])
  end

private
  def product_params
<<<<<<< HEAD
    params.require(:product).permit(:title, :artist, :genre, :image, :price, :disk, :stock, :status,)
  end
=======
    params.require(:product).permit(:title, :artist, :genre, :image, :price, :disk, :stock, :status)
end

>>>>>>> master
end
