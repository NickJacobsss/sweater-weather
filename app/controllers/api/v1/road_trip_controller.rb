class Api::V1::RoadTripController < ApplicationController

  def index
    start = params[:origin]
    finish = params[:destination]
    key = params[:api_key]
    if User.find_by(api_key: key)
      begin
        forecast_and_time = RoadTripFacade.get_future_forecast(start,finish)
        render json: RoadTripSerializer.format_road_trip(start, finish, forecast_and_time)
      rescue NoMethodError
        render json: RoadTripSerializer.impossible_route(start,finish)
      end
    else
      render json: {error: "Unauthorized API Key"}, status: 400
    end
  end
end
