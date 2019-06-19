class CartProduct < ApplicationRecord
  validates :quantity, presence: { message: "must be given" }
  
  belongs_to :cart
  belongs_to :product
end

