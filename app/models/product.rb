class Product < ApplicationRecord
  has_many_attached :images
  
  belongs_to :shop_owner
  belongs_to :shop


  validates :name, :description, length: { minimum: 4 }
  validates :price, :quantity, numericality: { only_integer: true, greater_than: 0 }
end
