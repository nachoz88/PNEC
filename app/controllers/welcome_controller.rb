class WelcomeController < ApplicationController
  
before_filter :authenticate_user! ,:except => [:index]
before_filter :is_admin?, :except => [:index]

def is_admin?
  if current_user.role == 2
    true
  else
    redirect_to '/'
  end
end

  def index
    @categories = Category.all
  end
  
  def dashboard
  end
end
