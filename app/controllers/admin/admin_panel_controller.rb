class Admin::AdminPanelController < ApplicationController
	before_action :authenticate_user!
	before_action :user_is_admin

	def index
		#todos los trabajos	
		@jobs = Job.all
	end

	def user_devs
		#listamos a todos los devs
	end

	def user_companies
		#listamos a todos las compañias
	end
	
	def accept_job
		#aceptamos los trabajos
	end

	def delete_job
		#eliminamos el trabajo y damos una notificacion
	end
	
	private

		def params_jobs
			
		end

		def params_users
			
		end

		def user_is_admin
			unless current_user.admin?
				user_not_authorized
			end
		end

end