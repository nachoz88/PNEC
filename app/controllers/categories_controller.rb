class CategoriesController < ApplicationController
  
   before_filter :authenticate_user! 
before_filter :is_admin?

def is_admin?
  if current_user.role == 2
    true
  else
    redirect_to '/'
  end
end
    
    def index
    @categories = Category.all
    end
    
    def new
         
    end
    
    def edit
            @category = Category.find(params[:id])
    end
    
    
    def update
            @category = Category.find(params[:id])
 
          if @category.update(category_params)
            redirect_to @category
          else
            render 'edit'
         
          end
    end
    def show
       @category = Category.find(params[:id])
 
      
      end
    def create
    @category = Category.new(category_params)
    @category.save
    redirect_to @category
    end
    
     def status
      
        @category=Category.find(params[:id])
        if @category.products.present?
          flash[:error] = "The "+ @category.Category_Name+" category  has products. You cannot delete! "
          redirect_to '/categories' 
          
        else
        @category.destroy
        flash[:notice] = "The "+ @category.Category_Name+ " category has been deleted! "
        redirect_to '/categories'
        end
    end
    
    def category_params
    params.require(:category).permit(:Category_Name, :Description)
    end
    
end
