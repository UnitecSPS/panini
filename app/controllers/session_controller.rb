class SessionController < ApplicationController
	def new
	end

	def create
		#1-buscar el usuario
		user = User.find_by_email(params[:email])

		if user
			redirect_to countries_path
		else
			render :new
		end
	end

	def destroy
	end
end