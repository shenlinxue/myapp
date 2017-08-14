class AddDefaultWeightToCategory < ActiveRecord::Migration[5.0]
  def change
  	change_column_default :categories, :weight, 0
  end
end
