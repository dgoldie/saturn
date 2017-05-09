module Api
  class UsersController < ApplicationController
    def index
      ids = params[:ids]
      render json: { data: User.where("id in (?)", ids) }
    end


    def show
      user = User.find params[:id]
      render json: { data: user }
    end

    def create
      user = User.new
      user.update create_user_params
      if user.save
        render json: { data: user }
      else
        render json: { errors: user.errors }
      end
    end

    def update
      user = User.find params[:id]
      user.update update_user_params
      if user.save
        render json: { data: user }
      else
        render json: { errors: user.errors }
      end
    end

    def create_user_params
      params.require(:user).permit(:name, :email, profile: [:picture, :picture_large, :user_id, :identities, :is_verified, :link,  ])
    end

    def update_user_params
      params.require(:user).permit :name, :profile
    end
  end
end
