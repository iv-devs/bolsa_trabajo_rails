class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	before_action :configure_permitted_parameters, if: :devise_controller?


	protected

	def configure_permitted_parameters
		if resource_class == User
    	devise_parameter(:sign_up, params_user)
    	devise_parameter(:account_update, params_user)
    else
    	devise_parameter(:sign_up, params_admin)
    	devise_parameter(:account_update, params_admin)
		end
  end

  def devise_parameter(action, keys)
  	devise_parameter_sanitizer.permit(action, keys: keys )
  end

  def params_admin
  	[:name, :logo,:website,:descripction,:country,:tw, :github, :fanpage, :linkedin, :city ]
  end

  def params_user
  	[:username, :first_name, :last_name, :avatar, :description, :fb, :linkedin, :github, :web, :tw]
  end

  private

  	def user_not_authorized
    	flash[:alert] = "No estas autorizado muaajaja."
    	redirect_to(request.referrer || root_path)
  	end

end
