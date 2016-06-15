class OrdersController < ApplicationController



before_filter :authenticate_user! , :except => [:create,:findex]

before_filter :is_admin? , :except => [:create,:findex]

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
    def findex
       @orders=Order.includes(:item_orders).where(:User_ID => current_user.id)
    end
    def create
      if  @orders=Order.new(order_params)
        @orders.Order_Date=Time.now
        @orders.Order_Status=1
       else
           
       end
        @cart_items = CartItem.where(:User_ID => current_user.id)
        
        @orders.save
        @cart_items.each do |item|
             
            @orders.item_orders.create(:order_id => @orders.Order_ID,:product_id => item.Product_ID,:quantity =>item.Quantity,:price =>item.product.Price)
            
        end
        
        @cart_items.destroy_all
        redirect_to '/orders/findex'
        #  CartItem.destroy(@cart_item)
        
        # if @order = Order.create(order_params)
        # redirect_to '/products/findex'
        # else
        #   redirect_to '/products/cart_items'
        # end
    end
    def order_params
        params.require(:orders).permit(:User_ID, :Total_Price,:Order_Status)
    end
    # def order_params
    # params.require(:order).permit(item_orders_attributes: [:Product_ID, :Quantity])
    # end
    
    
end
