class Residence < ApplicationRecord
  has_many :items

  validates :name, :address, :city, :state, :zip_code, presence: true
  validates :name, length: { maximum: 255 }
  validates :address, length: { maximum: 255 }
  validates :city, length: { maximum: 100 }
  validates :state, length: { maximum: 2 }
  validates :zip_code, length: { maximum: 10 }
  validates :zip_code, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :zip_code, format: { with: /\A\d+\z/, message: "must be a positive integer" }
  validates :zip_code, uniqueness: { scope: [:address, :city, :state], message: "Residence with the same address already exists" }
end
