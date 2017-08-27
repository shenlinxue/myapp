class ShoppingCartsController < ApplicationController

  def index
  	@shopping_carts = current_user.shopping_carts.joins(:product)

  end

  def create
    @product = Product.find(params[:product_id])
    unless ShoppingCart.find_by(product_id: params[:product_id])
    	@shopping_cart = current_user.shopping_carts.new(
    		product_id: params[:product_id],
    		amount: 1
    		)
      @shopping_cart.save
    else
      @shopping_cart = ShoppingCart.find_by(product_id: params[:product_id])
      amount = @shopping_cart.amount
      @shopping_cart.update( amount: amount+1 )
    end
  	redirect_to action: :index
  end

  def update
  end

  def destroy
    @shopping_cart = ShoppingCart.find(params[:id])
    @shopping_cart.destroy
    redirect_to action: :index
  end
end
