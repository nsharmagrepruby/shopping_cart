class SessionsController < ApplicationController
  before_action :already_login, only: [:create, :new]
  
  def new  
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      UserJob.set(wait: 1.hour).perform_later(user)
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