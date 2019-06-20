class Address < ApplicationRecord
  validates :house_number, :area, :city, presence: true

  belongs_to :user
end
