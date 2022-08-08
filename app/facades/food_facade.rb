class FoodFacade

  def self.get_info(location, food)
    food_json = FoodService.get_food(location, food)
    Food.new(food_json)
    # lat_long = GeocodeFacade.city_location(location)
    # forecast = ForecastFacade.get_forecast(lat_long.lat,lat_long.long)
  end

end
