class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  layout :layout_by_resource
  protect_from_forgery with: :exception
  
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  protected

  def layout_by_resource
   if devise_controller?
     'devise/application'
   else
     'application'
   end
  end

end
