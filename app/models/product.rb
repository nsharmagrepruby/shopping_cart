class Product < ApplicationRecord
  validates :name, :description, length: { minimum: 4 }
  validates :quantity, :price, presence: true, numericality: { more_than: 0 }
  validate :non_zero

  def non_zero
    if self.price == nil
      self.errors.add(:price, "is empty")
    elsif self.price <= 0
      self.errors.add(:price, "must be more than 0")
    end
  end

  belongs_to :shop_owner
  belongs_to :shop

  has_many_attached :images
end
