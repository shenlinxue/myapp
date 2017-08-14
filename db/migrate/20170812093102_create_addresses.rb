class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :address, null: false
      t.string :name, null: false
      t.string :cellphone, null: false
      t.boolean :default_address, default: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
