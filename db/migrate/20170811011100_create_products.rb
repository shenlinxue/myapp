class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.string :status, default: "Off"
      t.integer :amount, default: 0, null: false
      t.decimal :price, precision: 10, scale: 2,  null: false

      t.timestamps
    end
  end
end
