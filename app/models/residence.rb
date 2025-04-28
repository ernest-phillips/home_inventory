class Residence < ApplicationRecord
  has_many :items, dependent: :destroy

  US_STATES = %w[
    AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD
    MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI
    SC SD TN TX UT VT VA WA WV WI WY
  ].freeze

  validates :name, :address, :city, :state, :zip_code, presence: true

  validates :name, length: { maximum: 255 }
  validates :address, length: { maximum: 255 }
  validates :city, length: { maximum: 100 }
  validates :state, length: { is: 2 }
  validates :zip_code, length: { is: 5 }, format: { with: /\A\d{5}\z/, message: "must be 5 digits" }
  validates :zip_code, uniqueness: { scope: %i[address city state],
                                     message: "Residence with the same address already exists" }
  validates :state, inclusion: { in: US_STATES, message: "%{value} is not a valid U.S. state abbreviation" }
end
