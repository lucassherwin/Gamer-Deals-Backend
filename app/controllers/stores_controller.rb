class StoresController < ApplicationController
    def index
        stores = Store.all
        render json: stores, include: [:game]
    end

    def create
        store = Store.create(stores_params)
        render json: store
    end

    def destroy
        store = UserGame.find_by(id: params[:id])
        store.destroy 

        render json: {message: 'sucessfully destroyed'}
    end

    private

    def stores_params
        params.require(:store).permit(:game_id, :name, :price, :link)
    end
end
