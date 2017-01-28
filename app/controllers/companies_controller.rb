class CompaniesController < ApplicationController
	def show
		@company = Company.friendly.find(params[:id])
	end
end