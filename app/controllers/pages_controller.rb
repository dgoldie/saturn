class PagesController < ApplicationController
  def index
    render json: {hello: "you"}
  end

end
