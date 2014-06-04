class UsersController < ApplicationController
  skip_before_filter :authenticate, only: [:new, :create]
  layout "external"
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
  		redirect_to countries_path
  	else
  		render :new
  	end
  end

  def show
    
  end

  def edit
  end

  private

  	def user_params
  		params.require(:user).permit!
  	end
end
