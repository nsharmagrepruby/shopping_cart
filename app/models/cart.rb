class Cart < ApplicationRecord
  has_many :cart_products, dependent: :destroy
  
  belongs_to :user

  def clean
    cart_products.destroy_all
    if cart_products.exists?
      self.errors.add(:cart_id, "cart not deleted")
    end
  end
end
