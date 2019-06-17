class CartsController < ApplicationController

  def new
  end

  def index
  end
  
  def create
    debugger
    #current_user.carts.new(cart_params)
    render plain: params[:cart_product][:products_id].inspect
  end

  private
  def cart_params
    params.require(:cart_product).permit(:products_id, :quantity)
  end
end
