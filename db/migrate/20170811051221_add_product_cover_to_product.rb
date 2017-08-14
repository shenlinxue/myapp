class AddProductCoverToProduct < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :products, :product_cover
  end
end
