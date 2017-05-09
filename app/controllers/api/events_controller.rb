module Api
  class EventsController < ApplicationController
    def index
      # ids = params[:ids]
      # render json: { data: Event.where("id in (?)", ids) }
      events = Event.all
      events = events.where("id in (?)", params[:id]) if params[:ids].present?
      events = events.where(category: params[:category]) if params[:category].present?
      events = events.where(live_now: params[:live_now]) if params[:live_now].present?
      events = events.where("start > ?", params[:after]) if params[:after].present?

      render json: { data: events.as_json(include: [:broadcaster]) }
    end


    def show
      event = Event.find params[:id]
      render json: { data: event.as_json(include: [:broadcaster]) }
    end

    def create
      event = Event.new
      event.update create_event_params
      if event.save
        render json: { data: event.as_json(include: [:broadcaster]) }
      else
        render json: { errors: event.errors }
      end
    end

    # def update
    #   event = Event.find params[:id]
    #   event.update update_event_params
    #   if event.save
    #     render json: { data: event }
    #   else
    #     render json: { errors: event.errors }
    #   end
    # end

    def create_event_params
      params.require(:event).permit :title, :start, :end, :category
    end

    # def update_event_params
    #   params.require(:event).permit :name, :profile
    # end
  end
end
