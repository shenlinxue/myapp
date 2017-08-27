class Admin::ProductsController < Admin::AdminController
  before_action :find_product, only: [:show, :edit, :update,:destroy]
  before_action :find_cate_roots, only: [:new, :edit]

  def index
    @products = Product.page(params[:page] || 1).per_page(params[:per_page] || 5).joins(:category)
  end

  def show
  end

  def new

    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "创建商品成功！"
      redirect_to action: :index
    else
      flash[:notice] = "创建商品失败！"
      render action: :new
    end
  end

  def edit
  end

  def update
    if @product = Product.update(product_params)
      flash[:notice] = "修改商品成功！"
      redirect_to action: :index
    else
      flash[:notice] = "修改商品失败！"
      redirect_to action: :edit
    end
  end

  def destroy
    @product.destroy
    flash[:notice] = "删除商品成功!"
    redirect_to action: :index
  end
  private
  def find_cate_roots
    @cates = Category.roots
  end
  def find_product
    @product = Product.find(params[:id])
  end
  def product_params
    params.require(:product).permit!
  end
end
