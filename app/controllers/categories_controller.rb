class CategoriesController < ApplicationController
  def show
  	@categories = Category.roots
  	@sub_category = Category.find(params[:id])
  	@products = @sub_category.products.onshelf.page(params[:page] || 1).per_page(6)
  	render 'products/index'
  end
end
