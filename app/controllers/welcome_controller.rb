class WelcomeController < ApplicationController
  before_action :already_login
  
  def index; end
end
