class ForecastService

  def self.connection
    Faraday.new(url: 'https://api.openweathermap.org/data/2.5/onecall?')
  end

  def self.forecast(lat,long)
    response = connection.get do |form|
      form.params['lat'] = lat
      form.params['lon'] = long
      form.params['units'] = 'imperial'
      form.params['appid'] = ENV['WEATHER_API_KEY']
    end
    JSON.parse(response.body, symbolize_names: true)
  end

end
