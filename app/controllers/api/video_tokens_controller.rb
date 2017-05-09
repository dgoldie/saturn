require 'twilio-ruby'

module Api
  class VideoTokensController < ApplicationController

    def create
      identity = params[:user_id]

      # Create an Access Token for Video usage
      token = Twilio::JWT::AccessToken.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_VIDEO_SID'], ENV['TWILIO_VIDEO_SECRET'], 3600, identity

      # Grant access to Video
      grant = Twilio::JWT::AccessToken::VideoGrant.new
      grant.room = "event-#{params[:event_id]}"
      token.add_grant grant

      # Generate the token and send to client
      token.to_jwt
      render json: { identity: identity, token: token.to_jwt }
    end
  end
end
