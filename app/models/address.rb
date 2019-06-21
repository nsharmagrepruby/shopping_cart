class Address < ApplicationRecord
  belongs_to :user
  
  validates :house_number, presence: true
  validates :area, :city, presence: true, length: { minimum: 5 }

end
