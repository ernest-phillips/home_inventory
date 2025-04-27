class Item < ApplicationRecord
  belongs_to :residence

  validates :name, :quantity, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :name, length: { maximum: 255 }
  validates :description, length: { maximum: 500 }
  validates :location, length: { maximum: 255 }
  validates :condition, inclusion: { in: %w[new used damaged] }
  validates :category, inclusion: { in: %w[electronics furniture clothing appliances] }
  validates :residence_id, presence: true
  validates :residence_id, numericality: { only_integer: true, greater_than: 0 }
  validates :residence_id, uniqueness: { scope: :name, message: "Item name must be unique within the same residence" }
  validates :residence_id, format: { with: /\A\d+\z/, message: "must be a positive integer" }
  validates :residence_id, length: { maximum: 255 }
end
