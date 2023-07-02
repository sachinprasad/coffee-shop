class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.references :item, index: true
      t.references :discounted_item, foreign_key: { to_table: 'items' }, index: true
      t.boolean :is_free, default: false
      t.decimal :discount_percent, precision: 5, scale: 2

      t.timestamps
    end
  end
end
