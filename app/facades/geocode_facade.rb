class GeocodeFacade

  def self.city_location(city)
    response = GeocodeService.city_location(city)
    Geocode.new(response)
  end 

end
