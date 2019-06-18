class ProductsController < ApplicationController
  before_action :check_authorization_user
 
  def index
    @products = Product.all
    @cart_product = CartProduct.new
  end
  
  def new
    redirect_to user_products_path unless shop_owner.present?
    @product = Product.new
  end

  def show
    @products = Product.where(shop_owner_id: shop_owner.id)
  end

  def create
    @product = Product.new(product_params.merge(get_shop_and_owner_params))
    if @product.save
      render plain: params[:product].inspect
    else 
      render 'new'
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :quantity, images: [])
  end

  def shop_owner
    current_user.shop_owner
  end

  def shop
    current_user.shop_owner.shop
  end

  def get_shop_and_owner_params
    { shop_owner_id: shop_owner.id, shop_id: shop.id }
  end
end

