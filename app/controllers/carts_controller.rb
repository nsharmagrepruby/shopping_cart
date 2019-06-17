class CartsController < ApplicationController

  def new
  end
  
  def show
    @cart = current_cart
  end

  def create
    current_cart.cart_products.new(cart_product_params)
    current_cart.save
  end

  private
  def cart_product_params
    params.require(:cart_product).permit(:product_id, :quantity)
  end

  def current_cart
    current_user.cart ? current_user.cart : current_user.cart.build  
  end
end
