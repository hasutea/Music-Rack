class Admins::ArtistController < ApplicationController

  layout "admin"

  def index
      @artists = Artist.all
      @artist = Artist.new
  end

def create
  @artist = Artist.new(artist_params)
  @artists = Artist.all
    if @artist.save
      flash[:info] = 'アーティストを新規登録しました！'
      redirect_to new_admins_product_path
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
