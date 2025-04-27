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
  validates :residence_id, numericality: { only_integer: true, greater_than: 0 }
  validates :residence_id,
            uniqueness: { scope: :name,
                          message: I18n.t('activerecord.errors.models.item.attributes.residence_id.unique_name_within_residence') }
  validates :residence_id,
            format: { with: /\A\d+\z/,
                      message: I18n.t('activerecord.errors.models.item.attributes.residence_id.invalid_format') }
  validates :residence_id, length: { maximum: 255 }
end
