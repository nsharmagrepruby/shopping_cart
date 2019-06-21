class CartProductsController < ApplicationController
  
  def edit
    render plain: "edit"
  end
  
  def destroy
    cart_product = current_user.cart.cart_products.find_by_id(params[:id])
    debugger
    cart_product.destroy
    if cart_product.destroyed?
      respond_to do |format|
        format.js
      end
    elsif
      render plain: "product is not deleted"
    end
  end
end
