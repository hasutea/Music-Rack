class Admins::UsersController < ApplicationController

  layout "admin"

  def index
    @users = User.all.order(id: "DESC")
  end

  def show
    @user = User.find(params[:id])
    @addresses = @user.addresses
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
