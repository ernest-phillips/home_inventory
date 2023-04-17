# frozen_string_literal: true

# Create Items

class CreateItems < ActiveRecord::Migration[7.0] # rubocop:todo Style/Documentation
  def change
    create_table :items do |t|
      t.string :item_name
      t.string :room
      t.string :type
      t.text :description
      t.integer :quantity
      t.decimal :purchase_amount, precision: 10, scale: 2
      t.string :model
      t.date :purchase_date
      t.decimal :value, precision: 10, scale: 2

      t.timestamps
    end
  end
end
