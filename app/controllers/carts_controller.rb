class CartsController < ApplicationController
  before_action :check_authorization_user
  
  def new
  end
  
  def show
    @cart = current_cart
  end

  def show
  end
  
  def create
    cart_product = current_cart.cart_products.new(cart_product_params)
    flash[:cart_product] = cart_product.errors.messages unless cart_product.save
    redirect_to user_products_path
  end

  private
  def cart_product_params
    params.require(:cart_product).permit(:product_id, :quantity)
  end

  def current_cart
    current_user.cart ||= (current_user.cart = Cart.new)
  end
end
