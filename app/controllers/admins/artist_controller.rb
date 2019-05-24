class Admins::ArtistController < ApplicationController

def index
    @artists = Artist.page(params[:page])
    @artist = Artist.new
end

def create
  @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to new_admins_product_path
    else
      render :index
    end
end

def destroy
end

private

  def artist_params
    params.require(:artist).permit(:artist)
  end

end
