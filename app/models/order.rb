class Order < ApplicationRecord
  has_many :order_products
  belongs_to :user
  
  after_initialize :add_order_product

  private

  def add_order_product
    user.cart.cart_products.each do |cart_product|
      cart_product_to_order_product(cart_product)
    end
    self.final_price = final_price_order
    user.cart.clean
  end

  def cart_product_to_order_product(cart_product)
    product_id_and_quantity = cart_product.attributes.slice('product_id','quantity')
    price = cart_product.product.price
    order_products.new(product_id_and_quantity.merge({price: price}))
  end

  def final_price_order
    order_products.inject(0) do | total_price, order_product|
      total_price += order_product.price * order_product.quantity
    end
  end
end
