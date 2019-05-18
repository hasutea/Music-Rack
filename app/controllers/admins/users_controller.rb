class Admins::UsersController < ApplicationController

  def index
    @users = User.all.order(id: "DESC")
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
