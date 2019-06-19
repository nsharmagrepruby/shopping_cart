class User < ApplicationRecord
  before_save :default_values
  
  has_secure_password
  
  validates :first_name, :last_name,:password, presence: true
  validates :email, presence: true, uniqueness: true
  
  has_many :orders
  has_many :addresses
  has_one :cart
  has_one :shop_owner

  enum role: ['customer', 'shop_owner']

  def default_values
    self.role ||= :customer
  end
end
