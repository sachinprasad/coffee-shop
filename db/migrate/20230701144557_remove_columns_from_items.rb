class RemoveColumnsFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :parent_id
    remove_column :items, :is_free
    remove_column :items, :discount_percent
  end
end
