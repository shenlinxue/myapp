class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true, null: false
      t.references :product, foreign_key: true, null: false
      t.integer :amount, null: false
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
