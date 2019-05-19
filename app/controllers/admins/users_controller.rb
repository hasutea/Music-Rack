class Admins::UsersController < ApplicationController

  layout "admin"

  def index
    @users = User.page(params[:page]).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @address = @user.addresses.where('created_at > ?', 1.day.ago).first
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
