class AddDetailsToResidences < ActiveRecord::Migration[7.1]
  def change
    add_column :residences, :city, :string
    add_column :residences, :state, :string
    add_column :residences, :zip_code, :string
  end
end
