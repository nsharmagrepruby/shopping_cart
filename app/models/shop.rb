class Shop < ApplicationRecord
  validates :name, presence: true
  
  has_many :shop_owner
end
