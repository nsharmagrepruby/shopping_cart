class Product < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :quantity, presence: true

  belongs_to :shop_owner
  belongs_to :shop

  has_many_attached :images
end
