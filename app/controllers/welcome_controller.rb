class WelcomeController < ApplicationController
  
before_filter :authenticate_user! ,:except => [:index,:contactus] 
before_filter :is_admin?, :except => [:index,:contactus]

def is_admin?
  if current_user.role == 2
    true
  else
    redirect_to '/'
  end
end

  def index
   @products = Product.where(:Status =>1)
  end
  
  def dashboard
    @order_count=Order.all.count
    @product_count=Product.where(:Status =>1).count
    @user_count=User.all.count
    @categories=Category.all
     @sales=Order.sum(:Total_Price)
     @sold=Order.includes(:item_orders).sum(:Quantity)
     #pride code candidate
     @prod=Product.joins(:category,:item_orders)
      @csales=@prod.group("Category_Name")
     @csales_sum=@csales.sum("Quantity")
    
  end
  
  def contactus
  end
end
