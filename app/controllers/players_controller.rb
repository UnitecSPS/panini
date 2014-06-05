class PlayersController < ApplicationController
  def show
    @country = Country.find(params[:country_id])
    @player = @country.players.find(params[:id])
  end

  def new
  	@country = Country.find(params[:country_id])
  	@player = @country.players.build
  end

  def create
  	@country = Country.find(params[:country_id])
  	@player = @country.players.build(player_param)

  	if @player.save
  		redirect_to @country
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  end

  private

  	def player_param
  		params.require(:player).permit!
  	end
end
