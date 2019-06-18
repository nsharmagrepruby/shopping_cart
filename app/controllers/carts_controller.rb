class CartsController < ApplicationController

  def new
  end
  
  def show
    @cart = current_cart
  end

  def show
  end
  
  def create
    current_cart.cart_products.new(cart_product_params)
    flash[:notice] = "Post successfully created" unless current_cart.save
    redirect_to user_products_path
  end

  private
  def cart_product_params
    params.require(:cart_product).permit(:product_id, :quantity)
  end

  def current_cart
    if current_user.cart 
     current_user.cart 
    else
      current_user.cart = Cart.new
    end
  end
end
