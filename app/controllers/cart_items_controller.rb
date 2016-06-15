class CartItemsController < ApplicationController
    def create
       
        @cart_item=CartItem.new(cartparams)
        
       if CartItem.where(:Product_ID => params[:cart_item][:Product_ID]).where(:User_ID => current_user.id).present?
           
           redirect_to '/products/findex?cat='
       else
            @cart_item.save
            redirect_to '/cart_items'
        
    end
        
        
    end
    
    
    
  
    
    def index
        @categories = Category.all
        @cart_items = CartItem.includes(:product).where(:User_ID => current_user.id)
        # @order = Order.new
        # @order.item_orders.new

    end
    def update
        @cart_item = CartItem.find(params[:id])
        if @cart_item.update_attributes (uparams)
            
            redirect_to '/cart_items'
        else
        end
        
    end
    
    def destroy
        @cart_item=CartItem.find(params[:id])
        @cart_item.destroy
        
            redirect_to '/cart_items'
    end
    
    def uparams
        params.permit(:User_ID, :Product_ID,:Quantity)
    end
     def cartparams
        params.require(:cart_item).permit(:User_ID, :Product_ID,:Quantity)
    end
end