class AddressesController < ApplicationController
  def index
    @addresses = current_user.addresses.where(address_type: "User").order(default_address: 'desc')
  end

  def new
    @address = current_user.addresses.new
  end

  def create
    if params[:address][:default_address] == "1"
      remove_default
    end
    @address = current_user.addresses.new(address_params)
    @address.address_type = "User"
    if @address.save
      flash[:notice] = "新建地址成功"
      redirect_to action: :index
    else
      flash[:notice] = "新建更新失败!"

      render  :new
    end
  end

  def set_to_default
    
    remove_default
    @address = Address.find(params[:id])
    @address.default_address = true
    @address.save
    flash[:notice] = "默认地址已更改"
    
    redirect_to action: :index
  end

  def remove_default
    if @old_default_address = current_user.addresses.where(default_address: true)
      @old_default_address.update_all(default_address: false)
    end
  end

  def edit
    @address = Address.find(params[:id])
    render :new
  end

  def update
    if params[:address][:default_address] == "1"
      remove_default
    end
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "地址更新成功!"
      redirect_to action: :index
    else
      flash[:notice] = "地址更新失败!"

      render action: :new
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    flash[:notice] = "地址已删除!"
    redirect_to action: :index
  end

  private
  def address_params
    params.require(:address).permit!
    
  end
end
