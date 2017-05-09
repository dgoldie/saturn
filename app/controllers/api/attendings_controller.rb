module Api
  class AttendingsController < ApplicationController
    def index
      # ids = params[:ids]
      # render json: { data: Event.where("id in (?)", ids) }
      attendings = Attending.all
      attendings = attendings.where("id in (?)", params[:id]) if params[:ids].present?
      attendings = attendings.where(viewer_id: params[:viewer_id]) if params[:viewer_id].present?
      attendings = attendings.where(event_id: params[:event_id]) if params[:event_id].present?

      render json: { data: attendings.as_json(include: [:viewer, :event]) }
    end


    # def show
    #   event = Attending.find params[:id]
    #   render json: { data: event }
    # end

    def create
      attending = Attending.new
      attending.update create_attending_params
      if attending.save
        render json: { data: attending.as_json(include: [:viewer, :event]) }
      else
        render json: { errors: attending.errors }
      end
    end

    def update
      attending = Attending.find params[:id]
      attending.update update_attending_params
      if attending.save
        render json: { data: attending.as_json(include: [:viewer, :event]) }
      else
        render json: { errors: attending.errors }
      end
    end

    def create_attending_params
      params.require(:attending).permit :viewer_id, :event_id
    end

    def update_attending_params
      params.require(:attending).permit :liked
    end
  end
end
