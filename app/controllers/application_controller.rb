class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email username password password_confirmation])
    end


    def after_sign_in_path_for(_resources)
        categories_path
    end
end
