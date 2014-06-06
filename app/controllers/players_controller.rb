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

  def add_one
    @country = Country.find(params[:country_id])
    @player = @country.players.find(params[:id])

    @player.quantity = @player.quantity + 1

    if @player.save
      if request.xhr?
        render json:{number: @player.number, quantity: @player.quantity}.to_json, status: 200
      else
        redirect_to country_path(@country)
      end
    else
      render json: @player.errors.full_messages.to_json, status: 422
    end
  end

  private

  	def player_param
  		params.require(:player).permit!
  	end
end
