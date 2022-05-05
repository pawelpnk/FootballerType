class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    # def configure_permitted_parameters
    #     devise_parameter_sanitizer.permit(:sing_up, keys: [:name, :role, :rate])
    #     devise_parameter_sanitizer.permit(:account_update, keys: [:name, :role, :rate])
    # end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) do |user_params|
          user_params.permit(:email, :password, :password_confirmation, :name, :rate)
        end
        devise_parameter_sanitizer.permit(:account_update) do |user_params|
          user_params.permit(:email, :password, :password_confirmation, :name, :current_password, :role, :rate)
        end
      end
end
