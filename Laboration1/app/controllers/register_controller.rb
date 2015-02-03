class RegisterController < ApplicationController
  def new
    if is_logged_in?
      redirect_to user_path(current_user)
    end
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    key = Key.new

    key.key = (0...20).map { (65 + rand(26)).chr }.join
    key.user = @user
    key.save
    if @user.save

      redirect_to login_path
    else

      flash.now[:danger] = 'Email/Password is invalid'
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
