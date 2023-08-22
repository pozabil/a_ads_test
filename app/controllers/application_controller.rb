class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit :sign_up, keys: User::ADDITIONAL_PARAMETERS_FOR_DEVISE
      devise_parameter_sanitizer.permit :account_update, keys: User::ADDITIONAL_PARAMETERS_FOR_DEVISE
    end
end
