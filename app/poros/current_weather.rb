class CurrentWeather
  attr_reader :datetime, :sunrise, :sunset, :temperature, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon

  def initialize(forecast_data)
    @datetime = Time.at(forecast_data[:current][:dt]).to_s
    @sunrise = Time.at(forecast_data[:current][:sunrise]).to_s
    @sunset = Time.at(forecast_data[:current][:sunset]).to_s
    @temperature = forecast_data[:current][:temp]
    @feels_like = forecast_data[:current][:feels_like]
    @humidity = forecast_data[:current][:humidity]
    @uvi = forecast_data[:current][:uvi]
    @visibility = forecast_data[:current][:visibility]
    @conditions = forecast_data[:current][:weather][0][:description]
    @icon = forecast_data[:current][:weather][0][:icon]
  end

end
