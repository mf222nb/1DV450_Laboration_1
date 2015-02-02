class LoginController < ApplicationController
  def index

  end

  def create
    #Hämtar ut användaren med ett visst email
    user = User.find_by(name: params[:login][:name].downcase)

    if user && user.authenticate(params[:login][:password])

      log_in user

      redirect_to user

    else

      flash.now[:danger] = 'Wrong email or password'
      render 'index'
    end
  end

  def destroy
    log_out

    flash[:success] = 'You have logged out'
    redirect_to root_url
  end
end
