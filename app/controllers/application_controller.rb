class ApplicationController < ActionController::Base

	before_action :store_current_location, unless: :devise_controller?

	before_action :configure_permitted_parameters, if: :devise_controller?

 protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:kana_last_name,:kana_first_name,:telephone])
 end

 private

 def store_current_location
 	store_location_for(:user, request.url)
 end

end
