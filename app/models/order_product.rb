class OrderProduct < ApplicationRecord
  validate :check_order_quantity
  
  belongs_to :order
  belongs_to :product



  def check_order_quantity
    if self.quantity <= self.product.quantity
      self.product.quantity -= self.quantity 
      self.product.update_attribute(:quantity, self.product.quantity)
    else
      self.errors.add(:quantity, "You added More Stock than available")
    end
  end
end
