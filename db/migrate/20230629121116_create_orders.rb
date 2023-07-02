class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, index: true
      t.decimal :final_total, precision: 8, scale: 2
      t.integer :order_status

      t.timestamps
    end
  end
end
