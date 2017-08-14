class ShoppingCartsController < ApplicationController
	
  def index
  	@shopping_carts = current_user.shopping_carts.joins(:product)

  end

  def create
    amount ||= 1 

    unless ShoppingCart.find_by(product_id: params[:product_id])
    	@shopping_cart = ShoppingCart.create(
    		{user_id: current_user.id,
    		product_id: params[:product_id],
    		amount: amount }
    		)
    else
      @shopping_cart = ShoppingCart.find_by(product_id: params[:product_id])
      @shopping_cart = @shopping_cart.update(
        {user_id: current_user.id,
        product_id: params[:product_id],
        amount: amount+1 }
        )
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
