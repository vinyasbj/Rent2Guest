class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parametes, if: :devise_controller?
  protect_from_forgery with: :exception
  protected
  def configure_permitted_parametes
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit({ keys: [] }, :first_name, :last_name, :role_id,:number,:email, :password,:username, :password_confirmation)
    end

  end
end
