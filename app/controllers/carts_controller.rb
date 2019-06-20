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
    @cart_product = current_cart.cart_products.new(cart_product_params)
    if product_already_added
      update_quantity
    else
      flash[:cart_product] = @cart_product.errors.messages unless @cart_product.save
    end
    redirect_to products_path
  end

  private
  def cart_product_params
    params.require(:cart_product).permit(:product_id, :quantity)
  end

  def current_cart
    current_user.cart ||= (current_user.cart = Cart.new)
  end

  def product_already_added
    current_cart.cart_products.find_by(product_id: product_id)
  end

  def update_quantity
    update_quantity = product_already_added.quantity + @cart_product.quantity.to_i
    product_already_added.update_attribute(:quantity, update_quantity)
  end

  def product_id
    params[:cart_product][:product_id]
  end
end
