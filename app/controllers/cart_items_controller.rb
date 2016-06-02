class CartItemsController < ApplicationController
    def create
       
        @cart_item=CartItem.new(cartparams)
        
       if CartItem.where(:Product_ID => params[:cart_item][:Product_ID]).where(:User_ID => current_user.id).present?
           
           redirect_to '/products/findex'
       else
            @cart_item.save
            redirect_to '/cart_items/'
        
    end
        
        
    end
    
    
    
    def cartparams
        params.require(:cart_item).permit(:User_ID, :Product_ID, :Quantity,:Price)
    end
    
    def index
        @cart_items = CartItem.where(:User_ID => current_user.id)
        @total=@cart_items.sum(:Price) 
    end
    
    def destroy
        @cart_item=CartItem.find(params[:id])
        @cart_item.destroy
        redirect_to '/cart_items'
    end
end
