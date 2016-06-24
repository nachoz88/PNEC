class ProductsController < ApplicationController
    

before_filter :authenticate_user! , :except => [:findex,:fshow]
before_filter :is_admin?, :except => [:findex,:fshow]

def is_admin?
  if current_user.role == 2
    true
  else
    redirect_to '/'
  end
end


    def index
         
        @products = Product.all
    end
    def new
       
        @category_options = Category.all.map{ |u| [ u.Category_Name, u.Category_ID ] }
    end
     def edit
       
        @category_options = Category.all.map{ |u| [ u.Category_Name, u.Category_ID ] }
        @product = Product.find(params[:id])
             
            

    end
    
    def findex
        if params[:cat]!=''
                 @products = Product.includes(:category).where(:Category_ID => params[:cat]).where(:Status =>1)
                 @cat_selected=Category.where(:Category_ID => params[:cat]).first
                 
        else
               @products = Product.where(:Status =>1)
        end
        @total=Product.where(:Status =>1).count
    end
    
    def fshow
        @product = Product.includes(:category).find(params[:id])
        @rel_products = Product.includes(:category).where(:Category_ID => @product.Category_ID).where.not(:Product_ID => @product.Product_ID) 
    end
    def update
             @product = Product.find(params[:id])
         @product.Image = params[:file]
            #  @product.Status=1
            #  @product.save
            puts product_params
          if  @product.update(product_params)
            redirect_to  @product
          else
            render 'edit'
         
          end
    end
    def show
       @product = Product.find(params[:id])
       
 
      
      end
    def create
    @product = Product.new(product_params)
    @product.Image = params[:file]
    @product.Status=1
    @product.save
    redirect_to @product
    end
    
    def status
       @product = Product.find(params[:id])
       if  @product.Status=1
       @product.update_attributes(:Status =>2)
       
   else
       @product.update_attributes(:Status => 1)
        
    end
    
    redirect_to "/products"
    end
    
    
    
    
    def product_params
    params.require(:product).permit(:Product_Name, :Description, :Price, :Category_ID, :Image, :Status)
    end
end
