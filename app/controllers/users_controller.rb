class UsersController < ApplicationController
	before_action :authenticate_user!
	def show
		@user = User.includes(:postulations).friendly.find(params[:id])
		authorize @user
	end

	def postulation_detail
		@postulation = User.friendly.find(current_user).postulations.find(params[:postulation_id])
	end

end