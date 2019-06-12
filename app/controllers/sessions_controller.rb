class SessionsController < ApplicationController
  
  def new
    redirect_if_user_login
  end

  def create
    redirect_if_user_login
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user, notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end