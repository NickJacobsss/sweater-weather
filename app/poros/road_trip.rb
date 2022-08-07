class RoadTrip
  attr_reader :finished_forecast

  def initialize(route, forecast)
    @finished_forecast = destination_forecast(route, forecast)
  end

  def destination_forecast(route, forecast)
    if route.total_hours < 24
      future_forecast = forecast[:hourly][route.total_hours - 1]
    else
      future_forecast = forecast[:daily][(route.total_hours - 1) / 24]
    end
    return future_forecast
  end

end
