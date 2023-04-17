# frozen_string_literal: true

# Item model

class Item < ApplicationRecord # rubocop:todo Style/Documentation
  has_one_attached :image, dependent: :destroy
end
