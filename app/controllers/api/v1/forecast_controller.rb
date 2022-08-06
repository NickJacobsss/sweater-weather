class Api::V1::ForecastController < ApplicationController
  def index
    if params[:location].present?
      lat_long = GeocodeFacade.city_location(params[:location])
      forecast = ForecastFacade.get_forecast(lat_long.lat, lat_long.long)
      render json: ForecastSerializer.format_forecast(forecast)
    else
      render status: :bad_request, json: { error: 'please enter city & state' }
    end
  end
end
