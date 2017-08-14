class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true, null: false
      t.references :address, foreign_key: true, null: false
      t.string :status
      t.decimal :total_money, precision: 10, scale: 2
      t.datetime :payment_at

      t.timestamps
    end
  end
end
