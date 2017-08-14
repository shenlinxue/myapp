class AddAddressTypeToAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :address_type, :string
    Address.find_each do |a|
      a.address_type = "User"
      a.save
    end
  end
end
