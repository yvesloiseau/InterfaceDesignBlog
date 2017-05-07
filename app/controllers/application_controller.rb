class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

  #  protect_from_forgery with: :exception
  protect_from_forgery with: :exception
  @users = User.all

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                              keys:   [:first_name,
                                       :last_name,
                                       :alternate_email])
    devise_parameter_sanitizer.permit(:accout_update,
                              keys: [:first_name,
                                     :last_name,
                                     :alternate_email])
  end
end
