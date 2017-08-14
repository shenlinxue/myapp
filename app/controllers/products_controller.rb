class ProductsController < ApplicationController
	  skip_before_action :auth_user

  def index
  	@products = Product.where(status: "On") 
  end

  def search
  	@products = Product.where("name like ?", "%#{params[:name]}%")
  	render :index
  end
end
