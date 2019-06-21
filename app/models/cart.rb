class Cart < ApplicationRecord
  has_many :cart_products, dependent: :destroy
  
  belongs_to :user

  def clean
    cart_products.each do |cart_product|
      cart_product.destroy
    end
  end
end
