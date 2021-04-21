class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
   before_action :configure_permitted_parameters, if: :devise_controller?
   # before_action :masquerade_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
 
  before_action :set_cache_headers
  def set_cache_headers
    response.headers['Cache_Control'] = 'no-cache, no-store'
    response.headers['pragma'] = 'no-store'
    response.headers['Expires'] = 'Mon, 01 Jan 1990 00:00:00 GMT'
  end

end
