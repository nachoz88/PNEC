class UsersController < ApplicationController
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
        @users=User.all
    end
    def show
        @user=User.find(params[:id])
        @order_count = @user.orders.count
    end 
    def create
      @user = User.new(params[:user].permit(:name))
if verify_recaptcha(model: @user) && @user.save
  redirect_to @user
else
  render 'new'
end
    end
end
