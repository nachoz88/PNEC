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
   @products = Product.all
  end
  
  def dashboard
    @order_count=Order.all.count
    @product_count=Product.all.count
    @user_count=User.all.count
    @categories=Category.all
    
  end
  
  def contactus
  end
end
