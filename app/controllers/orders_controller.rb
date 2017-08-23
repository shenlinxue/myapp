class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def show
  end

  def new


      @addresses = current_user.addresses.where(address_type: "User").order(default_address: 'desc')
      @shopping_carts = current_user.shopping_carts.joins(:product)

  end

  def create
    unless params[:address_id]
      flash[:notice] = "请选择默认地址！"
      redirect_to :back
    else
      #创建订单地址,为order类型
      @user_address = Address.find(params[:address_id])
      params_address = @user_address.attributes.except("id","create_at","update_at")
      @address = Address.new(params_address)
      @address.address_type = "Order"
      @address.save

      #创建订单
      address_id = @address.id

      @shopping_carts = current_user.shopping_carts.joins(:product)
      total_money = @shopping_carts.sum { |cart| cart.amount * cart.product.price }
      @order = current_user.orders.create({
        total_money: total_money,
        address_id: address_id,
        status: "未支付"
        })

      #创建订单中商品
      @shopping_carts = current_user.shopping_carts.joins(:product)
      @shopping_carts.each do |shopping_cart|
        @order.order_items.create({
          product_id: shopping_cart.product.id,
          amount: shopping_cart.amount,
          price: shopping_cart.product.price
        })
        shopping_cart.destroy

      end

      redirect_to payments_path
    end


  end

  def destroy
  end
end
