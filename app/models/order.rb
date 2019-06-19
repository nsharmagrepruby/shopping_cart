class Order < ApplicationRecord
  before_save :add_order_product
  belongs_to :user
  has_many :order_products

  private
  def add_order_product
    current_user = self.user
    current_user.cart.cart_products.each do |cart_product|
      cart_product_to_order_product(cart_product)
    end
    self.final_price = final_price_order
    current_user.cart.destroy
  end

  def cart_product_to_order_product(cart_product)
    order_product = self.order_products.new
    order_product.product = cart_product.product
    order_product.price = cart_product.product.price
    order_product.quantity = cart_product.quantity
  end

  def final_price_order
    final_price_order = 0
    self.order_products.each do |order_product|
      final_price_order += order_product.price * order_product.quantity
    end
    final_price_order
  end
end
