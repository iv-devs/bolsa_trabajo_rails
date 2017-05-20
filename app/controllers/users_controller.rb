class UsersController < ApplicationController
	before_action :authenticate_user!
	def show
		@user = User.includes(:postulations).friendly.find(params[:id])
		authorize @user
	end

end