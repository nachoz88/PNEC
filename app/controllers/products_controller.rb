class ProductsController < ApplicationController
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
        @products = Product.all
        @total=Product.count
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
    redirect_to '/dashboard'
    end
    def product_params
    params.require(:product).permit(:Product_Name, :Description, :Price, :Category_ID, :Image, :Status)
    end
end
