class CartsController < ApplicationController
  before_action :check_authenticate_user
  
  def new; end
  
  def show
    @cart = current_cart
  end

  def show; end
  
  def create
    if existed_product.present?
      update_quantity
      @cart_product = existed_product
      flash[:messages] = "update_quantity"
    else
      @cart_product = current_cart.cart_products.new(cart_product_params)
      flash[:messages] = @cart_product.errors.messages unless @cart_product.save
    end
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:product_id, :quantity)
  end

  def current_cart
    current_user.cart ||=  Cart.new
  end

  def update_quantity
    existed_product.update_quantity!(added_quantity)
  end

  def product_id
    params.dig(:cart_product, :product_id)
  end 

  def added_quantity
    params[:cart_product][:quantity].to_i
  end 

  def existed_product
    current_cart.cart_products.find_by(product_id: product_id)
  end
end
