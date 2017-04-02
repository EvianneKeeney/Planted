class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:longitude])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:latitude])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:city])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:state])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:country])

  end

end
