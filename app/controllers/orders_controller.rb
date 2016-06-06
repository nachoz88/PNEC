class OrdersController < ApplicationController
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
    @orders = Order.all
    end
    def create
        @orders=Order.new(order_params)
        @orders.Order_Date=Time.now
        @orders.Order_Status=1
       
        @cart_items = CartItem.where(:User_ID => current_user.id)
        
        @orders.save
        @cart_items.each do |item|
             
             @orders.item_orders.create(:product => Product.find(item.Product_ID))
        
        end
       
        
        redirect_to '/products/findex'
    end
    def order_params
        params.require(:orders).permit(:User_ID, :Total_Price)
    end
    
    
end
