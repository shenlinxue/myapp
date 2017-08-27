class ProductsController < ApplicationController
	  skip_before_action :auth_user

  def index
  	@categories = Category.roots
  	@products = Product.page(params[:page] || 1).per_page(params[:per_page] || 6).where(status: "On")
  end

  def search

  	@products = Product.page(params[:page] || 1).per_page(params[:per_page] || 6).where("name like ?", "%#{params[:name]}%")
  	render :index
  end
end
