class CartProduct < ApplicationRecord
  validates :quantity, presence: true
  
  belongs_to :cart
  belongs_to :product
end

