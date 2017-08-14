class Admin::ProductsController < Admin::AdminController
  def index
    @products = Product.joins(:category)
  end

  def show
    @product = Product.find(parmas[:id])
  end

  def new
    @cates = Category.roots
    @product = Product.new
  end

  def create

    @product = Product.new(product_params)
    if @product.save
      redirect_to action: :index
    else
      redirect_to action: :new
    end
  end

  def edit
    @cates = Category.roots
    @product = Product.find(params[:id])
  

  end

  def update
    @product = Product.find(params[:id])
    
    if @product = Product.update(product_params)
      redirect_to action: :index
    else
      redirect_to action: :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to action: :index
  end
  private
  def product_params
    params.require(:product).permit!
  end
end
