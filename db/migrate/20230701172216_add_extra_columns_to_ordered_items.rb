class AddExtraColumnsToOrderedItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :ordered_items, :offer, foreign_key: true
    add_column :ordered_items, :quantity, :integer, default: 1
  end
end
