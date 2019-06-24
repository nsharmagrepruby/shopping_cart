class CartProductsController < ApplicationController
  
  def edit
    render plain: "edit"
  end
  
  def show
  end

  def destroy
    cart_product = current_user.cart.cart_products.find_by_id(params[:id])
    cart_product.destroy
    render plain: "product is not deleted" unless cart_product.destroyed?
  end
end
