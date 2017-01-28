class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


	protected

	  def devise_parameter_sanitizer
	    if resource_class == User
	      User::ParameterSanitizer.new(User, :user, params)
	    else
	      Company::ParameterSanitizer.new(Company, :company, params)
	    end
	  end

  private

  	def user_not_authorized
    	flash[:alert] = "No estas autorizado muaajaja."
    	redirect_to(request.referrer || root_path)
  	end

end
