class CategoriesController < ApplicationController
  def show
  	@categories = Category.roots
  	@sub_category = Category.find(params[:id])
  	@products = @sub_category.products.page(1).per_page(5)
  	render 'products/index'
  end
end
