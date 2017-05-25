class CompaniesController < ApplicationController
	before_action :authenticate_company!
	def show
		@company = Company.includes(:jobs).friendly.find(params[:id])
	end

	def list_user_job_postulation
		@job = Job.includes(:postulations).friendly.find(params[:job_id])
	end

	def user_postulation_details
		@postulation = Postulation.find(params[:postulation_id])
	end

end