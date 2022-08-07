class RoadTrip
  attr_reader :finished_forecast, :travel_time

  def initialize(route, forecast)
    @finished_forecast = destination_forecast(route, forecast)
    @travel_time = route.formatted_time
  end

  def destination_forecast(route, forecast)
    if route.total_hours < 24
      future_forecast = forecast[:hourly][route.total_hours - 1]
      temp_condition = {temp: future_forecast.temp, conditions: future_forecast.conditions}
    else
      future_forecast = forecast[:daily][(route.total_hours - 1) / 24]
      temp_condition = {temp: future_forecast.max_temp, conditions: future_forecast.conditions}
    end
    return temp_condition
  end

end
