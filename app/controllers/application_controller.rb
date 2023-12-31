class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def sign_out_user
    sign_out current_user
    redirect_to root_path
  end

  protected

  def after_sign_in_path_for(_resource)
    groups_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
