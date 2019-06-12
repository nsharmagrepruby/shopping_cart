class ProductsController < ApplicationController
 
  def index
    @products = Product.all
    render @products
  end
  
  def new
    @product = Product.new
    shop_owner = ShopOwner.find_by_user_id(current_user.id)
    session[:shop_id] = shop_owner.shop_id
    session[:shop_owner_id] = shop_owner.id
  end

  def create
    @shop_owner = ShopOwner.find_by_user_id(current_user.id)
    render plain: params[:product].inspect
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :quantity)
  end
end
