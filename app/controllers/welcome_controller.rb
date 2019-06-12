class WelcomeController < ApplicationController
  before_action :redirect_if_user_login
  def index
  end
end
