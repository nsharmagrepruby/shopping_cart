class Shop < ApplicationRecord
  has_many :shop_owners
  
  validates :name, presence: true
end
