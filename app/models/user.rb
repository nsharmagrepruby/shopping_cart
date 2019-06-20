class User < ApplicationRecord
  has_many :orders
  has_many :addresses
  has_one :cart
  has_one :shop_owner

  has_secure_password

  after_initialize :set_role

  validates :first_name, :last_name, :password, presence: true
  validates :email, presence: true, uniqueness: true
  
  enum role: ['customer', 'shop_owner']

  def set_role
    self.role ||= :customer
  end
end
