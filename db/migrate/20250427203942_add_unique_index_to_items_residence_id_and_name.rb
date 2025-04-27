class AddUniqueIndexToItemsResidenceIdAndName < ActiveRecord::Migration[7.1]
  def change
    # Adding a unique index to the items table on residence_id and name
    # This ensures that each residence can only have one item with a specific name
    add_index :items, [:residence_id, :name], unique: true
  end
end
