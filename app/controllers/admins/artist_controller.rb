class Admins::ArtistController < ApplicationController

  layout "admin"

  def index
      @artists = Artist.page(params[:page])
      @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    @artists = Artist.page(params[:page])
      if @artist.save
        redirect_to new_admins_product_path, notice: "アーティストを新規登録しました！"
      else
        render :index
      end
  end

  def destroy
      @artist = Artist.find(params[:id])
      @artist.destroy
      redirect_to admins_artist_index_path
  end

private

  def artist_params
    params.require(:artist).permit(:artist)
  end

end
