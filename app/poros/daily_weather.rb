class DailyWeather
  attr_reader :date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon, :temp

  def initialize(forecast_data)
    @date = Time.at(forecast_data[:dt]).strftime("%-d %b %Y").to_s
    @sunrise = Time.at(forecast_data[:sunrise]).strftime("%H:%M").to_s
    @sunset = Time.at(forecast_data[:sunset]).strftime("%H:%M").to_s
    @max_temp = forecast_data[:temp][:max]
    @min_temp = forecast_data[:temp][:min]
    @conditions = forecast_data[:weather][0][:main]
    @icon = forecast_data[:weather][0][:icon]
  end
end
