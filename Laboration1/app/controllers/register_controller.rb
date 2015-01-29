class RegisterController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    @user.key = 'hej'

    if @user.save
      # When player is created i will redirect user to a page that list all players in the team
      # /teams/:id/players
      redirect_to login_path
    else
      # just render the new.html.erb template (holding the form - should give us error messages)
      flash.now[:danger] = 'Email/Password is invalid'
      render 'new'
    end
  end

  private
  # Using a private method to encapsulate the permissible parameters is just a good pattern
  # since you'll be able to reuse the same permit list between create and update.
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
