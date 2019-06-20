class ShopsController < ApplicationController
  before_action :check_role

  def products
    @products = current_user.shop_owner.shop.products
  end

  private
  
  def check_role
    render plain: 'You are not a shop owner' if current_user.customer?
  end
end
