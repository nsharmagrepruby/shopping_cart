class Product < ApplicationRecord
  belongs_to :shop_owner
  belongs_to :shop

  has_many_attached :images

  validates :name, :description, length: { minimum: 4 }
  validates :price, :quantity, numericality: { only_integer: true, greater_than: 0 }
end
