class CartProductsController < ApplicationController
  
  def edit
    render plain: "edit"
  end
  
  def destroy
    cart_product = CartProduct.find_by_id(params[:id])
    cart_product.destroy
    if cart_product.destroyed?
      redirect_to products_path
    elsif
      render plain: "product is not deleted"
    end
  end
end
