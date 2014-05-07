class PlayersController < ApplicationController
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

  private

  	def player_param
  		params.require(:player).permit!
  	end
end
