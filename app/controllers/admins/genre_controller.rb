class Admins::GenreController < ApplicationController

  layout "admin"

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to new_admins_product_path, notice: "ジャンルを新規登録しました！"
    else
      render :index
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admins_genre_index_path
  end

  private
    def genre_params
      params.require(:genre).permit(:genre)
    end

end
