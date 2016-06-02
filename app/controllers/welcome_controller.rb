class WelcomeController < ApplicationController
  def index
    @categories = Category.all
  end
  def dashboard
  end
end
