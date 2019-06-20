class Address < ApplicationRecord
  validates :house_number, presence: true
  validates :area, :city, presence: true, length: { minimum: 5 }

  belongs_to :user
end
