class ForecastFacade

  def self.get_forecast(lat, long)
    all_forecasts = ForecastService.forecast(lat, long)
    current_forecast = CurrentWeather.new(all_forecasts)

    daily_forecasts = all_forecasts[:daily][0..4].map do |daily|
      DailyWeather.new(daily)
    end

    hourly_forecasts = all_forecasts[:hourly][0..7].map do |hourly|
      HourlyWeather.new(hourly)
    end

    {current: current_forecast, daily: daily_forecasts, hourly: hourly_forecasts}
  end
  
end
