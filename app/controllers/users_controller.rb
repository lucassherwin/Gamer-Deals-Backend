class UsersController < ApplicationController

    def index
        users = User.all
        render json: users, include: [:games]
    end

    def show
        user = User.create(user_params)
        render json: user, include: [:games]
    end

    def create
        user = User.create(user_params)
        render json :user
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
