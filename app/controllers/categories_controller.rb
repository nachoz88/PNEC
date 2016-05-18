class CategoriesController < ApplicationController
    
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
    redirect_to '/dashboard'
    end
    
    def category_params
    params.require(:category).permit(:Category_Name, :Description)
    end
    
end
