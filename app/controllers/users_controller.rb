class UsersController < ApplicationController

  before_action :correct_user, only: [:show, :edit]

  before_action :authenticate_user!, except: [:destroy]

  def show
    @user = User.find(params[:id])
    @address = @user.addresses.where('created_at > ?', 1.day.ago).first
  end

  def edit
    @user = User.find(params[:id])
    @address = @user.addresses.where('created_at > ?', 1.day.ago).first
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    if
      admin_signed_in?
      redirect_to admins_users_path
    else
      redirect_to root_path
    end
  end

  def cart
    # カートに入れるボタンを押された商品全てを表示(カートテーブルの商品id,ユーザーid,数量を取得して表示)
    # カート内に商品がなかったら、商品がないと表示
    @carts = current_user.carts
  end

private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :telephone, :email, :password, addresses_attributes: [:id, :address, :postal_code])
  end

  def correct_user
    user = User.find(params[:id])
    if current_user.id != user.id
      redirect_to root_path
    end
  end
end
