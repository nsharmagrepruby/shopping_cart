class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
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
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
