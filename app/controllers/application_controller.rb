class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def already_login
    redirect_to user_path(current_user) if current_user.present?
  end

  def check_authenticate_user
    redirect_to root_path if current_user.blank?
  end
end
