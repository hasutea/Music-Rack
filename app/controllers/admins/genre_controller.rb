class Admins::GenreController < ApplicationController

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to new_admins_product_path
    else
      render :index
    end
  end

  def destroy
  end

  private
    def genre_params
      params.require(:genre).permit(:genre)
    end

end
