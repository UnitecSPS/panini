class SessionController < ApplicationController
	skip_before_filter :authenticate
	layout "external"
	
	def new
	end

	def create
		#1-buscar el usuario
		@user = User.find_by_email(params[:email])

		if @user && @user.authenticate(params[:password])
			login 
			redirect_to countries_path
		else
			flash[:notice] = "Usuario o Password es Incorrecto"
			render :new
		end
	end

	def destroy
		reset_session
		redirect_to root_path
	end

	private

		def login
			session[:user_id] = @user.id
			cookies.signed[:user_email] = @user.email
		end
end