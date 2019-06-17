class OrdersController < ApplicationController
def index
    render plain: '123'
  end   

  def show
  end

  def create
    @order = current_user.orders.new
    @order.save

    current_user.cart.cart_products.each do |cart_product|
      cart_product_to_order_product(cart_product)
    end

    current_user.cart.destroy
  end

  private
  def cart_product_to_order_product(cart_product)
    order_product = @order.order_products.build
    order_product.product = cart_product.product
    order_product.price = cart_product.product.price
    order_product.quantity = cart_product.quantity
    order_product.save
  end

end
