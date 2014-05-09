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
    @country = Country.find(params[:id])
  end

  def update
    @country = Country.find(params[:id])

    if @country.update(country_params)
      redirect_to @country
    else
      render :edit
    end
  end

  def show
  	@country = Country.find(params[:id])
  end

  def destroy
  end

  def report
  end

  def own
    @country = Country.find(params[:id])
    @owns = @country.players.own
  end

  def missing
    @country = Country.find(params[:id])
    @missing = @country.players.missing
  end

  private

  	def country_params
  		params.require(:country).permit!
  	end
end
