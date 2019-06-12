class ShopOwner < ApplicationRecord
  belongs_to :shop
  belongs_to :user
end
