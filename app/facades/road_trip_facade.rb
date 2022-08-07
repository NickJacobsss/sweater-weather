class RoadTripFacade

  def self.get_future_forecast(start,finish)
    route_data = RouteService.get_route(start,finish)
    route = Route.new(route_data)
    lat_long = GeocodeFacade.city_location(finish)
    forecast = ForecastFacade.get_forecast(lat_long.lat, lat_long.long)
    road_trip = RoadTrip.new(route, forecast)
  end

end
