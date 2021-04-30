class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_cache_headers
  def set_cache_headers
    response.headers['Cache-Control'] = 'no-cache, no-store'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = 'Mon, 01 Jan 1990 00:00:00 GMT'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password, :avatar)
    end
  end
end
