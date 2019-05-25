class Admins::LabelController < ApplicationController

  layout "admin"

  def index
    @labels = Label.all
    @label = Label.new
  end

  def create
    @label = zlabel.new(genre_params)
    if @label.save
      redirect_to new_admins_product_path
    else
      render :index
    end
  end

  def destroy
  end

  private
    def genre_params
      params.require(:label).permit(:label)
    end

end
