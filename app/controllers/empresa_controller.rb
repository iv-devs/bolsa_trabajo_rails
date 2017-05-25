class EmpresaController < ApplicationController


	def show
		@company = Company.includes(:jobs).friendly.find(params[:id])
	end


end