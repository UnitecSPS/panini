class Api::CountriesController < Api::ApiController
	respond_to :json

	def index
		@countries = Country.includes(:players).order(:name)
	
		respond_with @countries
	end
end