class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
  	@address = @user.addresses.where('created_at > ?', 1.day.ago).first
  end

  def edit
    @user = User.find(params[:id])
    @address = @user.addresses.where()
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
  end

private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :telephone, :user_email, :user_password, :address, :postal_code)
  end
end
