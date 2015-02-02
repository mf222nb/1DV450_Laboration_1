class UsersController < ApplicationController

  before_action :check_user, only: [:show]
  before_action :correct_user, only: [:show, :destroy]
  before_action :admin_user, only: [:show, :destroy]

  def show
    @user = User.find(params[:id])
    @all_users = Key.all
    @key = Key.find_by_user_id(params[:id])
  end

  def destroy
    Key.find_by_user_id(params[:id]).destroy

    flash[:success] = "Din nyckel är borttagen"
    redirect_to user_path

  end

  def admin_show
    render 'admin_show'
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless @user == current_user
  end

  def admin_user
    redirect_to user_path(current_user) unless current_user.admin?
  end
end
