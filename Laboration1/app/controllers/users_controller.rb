class UsersController < ApplicationController

  before_action :check_user, only: [:show, :destroy]
  before_action :correct_user, only: [:show]

  def show
    @all_users = Key.all
    @key = Key.find_by_user_id(params[:id])
    @user = User.find(params[:id])
  end

  def destroy
    if Key.find_by_user_id(params[:id]).destroy

      flash[:success] = "Your key has been removed"
      redirect_to user_path
    else
      flash.now[:danger] = "Something went wrong"
      render 'show'
    end
  end

  def create
    key = Key.new
    key.key = (0...20).map { (65 + rand(26)).chr }.join
    key.user = User.find(params[:id])

    if key.save
      flash[:success] = "You have got a new key"
      redirect_to user_path(current_user)
    else
      flash.now[:danger] = "Something went wrong"
      render 'show'
    end
  end

  private
  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless @user == current_user || current_user.admin?
  end
end
