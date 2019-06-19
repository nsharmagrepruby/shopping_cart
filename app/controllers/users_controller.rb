class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      UserJob.perform_later(@user)
      redirect_to @user
    else 
      render 'new'
    end
  end

  def show
  end

  def edit
    @user = current_user
  end

  def update
     @user = current_user
    if params[:user][:password] == params[:user][:password_confirmation]
      current_user.update(user_params)
      redirect_to user_path(current_user)
    else        
      flash[:confirm_password] = 'password and confirm password must be same'
      redirect_to edit_user_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
