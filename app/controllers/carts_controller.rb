class CartsController < ApplicationController
  before_action :check_authorization_user
  
  def new; end
  
  def show
    @cart = current_cart
  end

  def show; end
  
  def create
    if past_prdoduct.present?
      update_quantity
    else
      @cart_product = current_cart.cart_products.new(cart_product_params)
      flash[:messages] = @cart_product.errors.messages unless @cart_product.save
    end
    redirect_to products_path
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:product_id, :quantity)
  end

  def current_cart
    current_user.cart ||=  Cart.new
  end

  def update_quantity
    past_prdoduct.update_quantity!(added_quantity)
  end

  def product_id
    params.dig(:cart_product, :product_id)
  end 

  def added_quantity
    params[:cart_product][:quantity].to_i
  end 

  def past_prdoduct
    current_cart.cart_products.find_by(product_id: product_id)
  end
end
