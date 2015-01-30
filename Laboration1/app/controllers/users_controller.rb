class UsersController < ApplicationController

  before_action :check_user, only: [:show]

  def show
    @user = User.find(params[:id])
    @key = Key.find_by_user_id(params[:id])
  end

  def destroy
    @key = Key.find(params[:id])
    user = User.find(params[:id])
    if @key.present?
      @key.destroy
    end

    redirect_to user

  end
end
