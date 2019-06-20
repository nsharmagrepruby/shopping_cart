class ProductsController < ApplicationController
  before_action :check_authorization_user
 
  def index
    @products = Product.all
    @cart_product = CartProduct.new
  end
  
  def new
    redirect_to products_path unless shop_owner.present?
    @product = Product.new
  end

  def show
    @product = Product.find_by_id(params[:id])
    render plain: "product is not available" unless @product
  end
  
  def create
    @product = Product.new(product_params.merge(get_shop_and_owner_params))
    if @product.save
      redirect_to @product
    else 
      render 'new'
    end
  end

  private
  def product_params
    params.require(:product).permit(extra_params)
  end

  def shop_owner
    current_user.shop_owner
  end

  def shop
    current_user.shop_owner.shop
  end

  def get_shop_and_owner_params
    {shop_owner_id: shop_owner.id, shop_id: shop.id}
  end

  def extra_params
    [:name, :description, :price, :quantity, images: []]
  end
end

