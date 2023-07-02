class CreateOrderedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_items do |t|
      t.references :item, index: true
      t.references :order, index: true
      t.decimal :amount_paid, precision: 8, scale: 2
      t.decimal :discount_applied, precision: 5, scale: 2
      t.decimal :tax_rate_applied, precision: 5, scale: 2

      t.timestamps
    end
  end
end
