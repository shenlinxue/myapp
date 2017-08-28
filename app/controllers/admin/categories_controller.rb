class Admin::CategoriesController < Admin::AdminController

  before_action :find_cate_roots, only: [:index, :new, :edit]
  before_action :find_category, only: [:edit, :update, :destroy]

  def index
    if params[:cate_root_id]
      @categories = Category.find(params[:cate_root_id]).children
    else
      @categories = @cate_roots
    end
  end

  def new
    @category = Category.new
    if params[:cate_root_id]
      @cate_root = Category.find(params[:cate_root_id])
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "新建分类成功！"
      if @category.root?
        redirect_to action: :index
      else
        redirect_to  admin_categories_path(cate_root_id: @category.root.id)
      end
    else
      flash[:notice] = "新建分类失败！"
      render action: :new
    end
  end

  def edit
  end

  def update
    @category.update(category_params)

    if @category.root?
      redirect_to action: :index
    else
      redirect_to action: :sub_index
    end

  end

  def destroy
    @category.destroy
    flash[:notice] = "删除分类成功！"
    redirect_to action: :index
  end

  private
  def find_category
    @category = Category.find(params[:id])
  end
  def find_cate_roots
    @cate_roots =  Category.roots

  end

  def category_params
    params.require(:category).permit!
  end
end
