class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
  	@address = @user.addresses.where('create_at > ?', 1.day.ago).first
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
