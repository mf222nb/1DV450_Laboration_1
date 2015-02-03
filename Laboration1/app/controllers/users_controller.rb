class UsersController < ApplicationController

  before_action :check_user, only: [:show, :destroy]
  before_action :correct_user, only: [:show]

  def show
    @all_users = Key.all
    @key = Key.find_by_user_id(params[:id])
  end

  def destroy
    if Key.find_by_user_id(params[:id]).destroy

      flash[:success] = "Din nyckel är borttagen"
      redirect_to user_path
    else
      flash[:danger] = "Något gick fel"
      render 'show'
    end
  end

  private
  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless @user == current_user || current_user.admin?
  end
end
