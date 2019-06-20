class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  
  validates :quantity, presence: { message: "must be given" }

  def update_quantity!(quantity)
    self.update(:quantity, self.quantity + quantity)
  end
end

