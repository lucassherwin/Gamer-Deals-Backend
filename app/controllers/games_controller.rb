class GamesController < ApplicationController

    def index 
        games = Game.all 
        render json: games, include: [:users]
    end

    def show
        game = Game.find_by(id: params[:id])
        render json: game, include: [:users]
    end

    def create 
        game = Game.create(game_params)
        render json: game
    end

    private

    def game_params
        params.require(:game).permit(:name, :api_id)
    end

end
