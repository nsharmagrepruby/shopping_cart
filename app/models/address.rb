class Address < ApplicationRecord
  validates :house_num, presence: true
  validates :area, presence: true
  validates :city, presence: true

  belongs_to :user
end
