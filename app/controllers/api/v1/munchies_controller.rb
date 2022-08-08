class Api::V1::MunchiesController < ApplicationController

  def index
    # location = params[:location]
    # food = params[:food]
    food_info = FoodFacade.get_info(params[:location], params[:food])
    lat_long = GeocodeFacade.city_location(params[:location])
    forecast = ForecastFacade.get_forecast(lat_long.lat, lat_long.long)
    render json: FoodSerializer.format_food(food_info, forecast, params[:location])
  end

end
