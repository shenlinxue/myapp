class Product < ApplicationRecord

	belongs_to :category
	# has_many :shopping_carts

	validates :name, presence: {message: "商品名称不能为空"}
	validates :name, uniqueness: {message: "商品名称不能重复"}
	validates :price, presence: {message: "价格不能为空"}
	validates :status, inclusion: { in: %w(On Off)}

	has_attached_file :product_cover, styles: { medium: "300x300^", thumb: "100x100^" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :product_cover, content_type: /\Aimage\/.*\z/


end
