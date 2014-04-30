class CountriesController < ApplicationController
  def index
  	@countries = Country.order("position ASC")
  end

  def new
  	@country = Country.new
  end

  def create
  	@country = Country.new(country_params)

  	if @country.save
      #flash[:notice] = "texto"
  		redirect_to countries_path, notice: "Created Masiso"
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  end

  def show
  	@country = Country.find(params[:id])
  end

  def destroy
  end

  private

  	def country_params
  		params.require(:country).permit!
  	end
end
