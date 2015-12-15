class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    #redirect_to root_url, :alert => 'Ban khong co quyen truy cap vao trang nay'
  	render :file => "#{Rails.root}/public/404.html", :status => 403, :layout => false
  end
  #demo


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :fullname, :address, :phone, :role) }
	devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :current_password, :fullname, :address, :phone, :role) }    
  end
end
