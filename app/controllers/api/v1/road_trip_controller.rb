class Api::V1::RoadTripController < ApplicationController

  def index
    start = params[:origin]
    finish = params[:destination]
    key = params[:api_key]
    if User.find_by(api_key: key)
      trip = RoadTripFacade.get_route(start,finish)
    else
      render json: {error: new_user.errors.full_messages.to_sentence}, status: 400
    end
  end

end
