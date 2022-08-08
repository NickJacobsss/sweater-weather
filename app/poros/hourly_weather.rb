class HourlyWeather
  attr_reader :time, :temp, :conditions, :icon

  def initialize(forecast_data)
    @time = Time.at(forecast_data[:dt]).strftime("%H:%M").to_s
    @temp = forecast_data[:temp]
    @conditions = forecast_data[:weather][0][:main]
    @icon = forecast_data[:weather][0][:icon]
  end

end
