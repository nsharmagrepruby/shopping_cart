class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  
  validate :check_order_quantity

  private
  
  def check_order_quantity
    if self.quantity <= self.product.quantity
      self.product.quantity -= self.quantity 
      self.product.update_attribute(:quantity, self.product.quantity)
    else
      self.errors.add(:quantity, "You added More Stock than available")
    end
  end
end
