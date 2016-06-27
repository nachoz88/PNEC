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
    @orders = Order.includes(:user).all
    @sales=Order.sum(:Total_Price)
    end
    def show
      @order=Order.includes(:user,:item_orders).find(params[:id])
      @item_count=@order.item_orders.count
    end
    def findex
       @orders=Order.includes(:item_orders).where(:User_ID => current_user.id)
       
    end
    def create
      
      amount = current_user.cart_total.to_i*100
       # Create the customer in Stripe
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      card: params[:stripeToken]
    )
 
    # Create the charge using the customer data returned by Stripe API
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: amount,
      description: 'PNEC',
      currency: 'kes',
      
    )
 
      if(customer && charge)
      
        if  @orders=Order.new(:User_ID => current_user.id, :Total_Price => current_user.cart_total)
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
          
          ReceiptMailer.receipt_email(params[:stripeEmail],@orders.Total_Price,@orders.Order_ID,current_user.name).deliver
          
          redirect_to '/orders/findex', :flash =>{:notice => ' Payment Successfull, Your Order has been made!, check your email for confirmation.'}
      else
        redirect_to '/cart_items',:flash => { :error => "Order Creation Unsuccessful" }
      end
     
    end
    def order_params
        params.require(:orders).permit(:User_ID, :Total_Price,:Order_Status)
    end
    # def order_params
    # params.require(:order).permit(item_orders_attributes: [:Product_ID, :Quantity])
    # end
    
    
end
