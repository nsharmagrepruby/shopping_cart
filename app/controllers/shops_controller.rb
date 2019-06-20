class ShopsController < ApplicationController
  before_action :check_role

  def products
    shop = current_user.shop_owner.shop
    @products = Product.where(shop: shop)
  end

  private
  def check_role
    render plain: 'You are not a shop owner' if current_user.shop_owner?
  end
end
