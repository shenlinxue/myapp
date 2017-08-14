class Admin::CategoriesController < Admin::AdminController

  
  def index
  
      @categories =  Category.roots
   
  end
  def sub_index
    @cate = Category.find(params[:id])
    @categories = @cate.children
    render action: :index
  end

  def new
    @cates = Category.roots
    @category = Category.new
  end

  def create
    
    @category = Category.new(category_params)
    @cate = Category.find(params[:ancestry])
    @category.parent = @cate
    if @category.save
      redirect_to action: :index
    else
      redirect_to action: :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to action: :index
  end

  private
  def category_params
    params.require(:category).permit!
  end
end
