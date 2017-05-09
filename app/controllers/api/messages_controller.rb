module Api
  class MessagesController < ApplicationController
    def index
      messages = Message.where(event_id: params[:event_id])
      messages = messages.where("id > ?", params[:before]) if params[:before].present?
      messages = messages.order("created_at desc")
      messages = messages.limit(params[:limit] || 100)
      render json: { data: messages.as_json(include: [:user, :event]) }
    end

    def show
      message = Message.find params[:id]
      render json: { data: message.as_json(include: [:user, :event]) }
    end

    def create
      message = Message.new
      message.update create_message_params
      if message.save
        render json: { data: message.as_json(include: [:user, :event]) }
      else
        render json: { errors: message.errors }
      end
    end

    # def update
    #   message = Message.find params[:id]
    #   message.update update_message_params
    #   if message.save
    #     render json: { data: message }
    #   else
    #     render json: { errors: message.errors }
    #   end
    # end

    def create_message_params
      params.require(:message).permit :user_id, :event_id, :body
    end

    # def update_message_params
    #   params.require(:message).permit :name, :profile
    # end
  end
end
