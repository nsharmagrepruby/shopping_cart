class Order < ApplicationRecord
  before_save :add_order_product
  belongs_to :user
  has_many :order_products

  private

  def add_order_product
    current_user = user
    current_user.cart.cart_products.each do |cart_product|
      cart_product_to_order_product(cart_product)
    end
    self.final_price = final_price_order
    current_user.cart.destroy
  end

  def cart_product_to_order_product(cart_product)
    order_products.new(cart_product.product.attributes.slice(
      :product_id, :quantity, :price))
    end

  def final_price_order
    order_products.each_with_object(0) do |order_product, final_price|
      final_price += order_product.price * order_product.quantity
    end
  end
end
