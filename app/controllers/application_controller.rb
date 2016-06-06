class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # before_action :authenticate_user!
  protect_from_forgery with: :exception
  
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    end




  def after_sign_in_path_for(resource)
    if @user.role == 2
      dashboard_path
    else
      root_path
    end
  end
end
