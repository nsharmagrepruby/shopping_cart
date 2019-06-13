class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  
  has_secure_password
  has_many :addresses
  has_one :role
  has_one :shop_owner
end
