class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :user, index: true
      t.string :name
      t.decimal :price, precision: 8, scale: 2
      t.decimal :tax_rate , precision: 5, scale: 2
      t.integer :parent_id
      t.boolean :is_free
      t.decimal :discount_percent, precision: 5, scale: 2

      t.timestamps
    end
  end
end
