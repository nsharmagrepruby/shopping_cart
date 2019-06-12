class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def redirect_if_user_login
    if current_user
      redirect_to user_path(current_user.id)
    end
  end

  def check_authorization_user
    debugger
    if params[:user_id].to_i != session[:user_id]
      redirect_to root_path
    end
  end
end
