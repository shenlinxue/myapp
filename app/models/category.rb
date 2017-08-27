class Category < ApplicationRecord
	has_ancestry orphan_strategy: :destroy

	has_many :products
	validates :title, presence: {message: "类别名称不能为空"}
	validates :title, uniqueness: {message: "名称不能重复"}


	before_validation :set_category_nil

	private
	def set_category_nil
		if self.ancestry.blank?
			self.ancestry = nil
		end
	end
end
