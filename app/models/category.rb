class Category < ApplicationRecord
	has_ancestry orphan_strategy: :destroy

	has_many :products
	validates :title, presence: {message: "类别名称不能为空"}
	validates :title, uniqueness: {message: "名称不能重复"}
end
