class RoadTripSerializer

  def self.format_road_trip(start, finish, forecast_time)
    {
    "data": {
      "id": "null",
      "type": "roadtrip",
      "attributes": {
        "start_city": start,
        "end_city": finish,
        "travel_time": forecast_time.travel_time,
        "weather_at_eta": {
          "temperature": forecast_time.finished_forecast[:temp],
          "conditions": forecast_time.finished_forecast[:conditions]
        }
      }
    }
  }
  end

  def self.impossible_route(start, finish)
    {
    "data": {
      "id": "null",
      "type": "roadtrip",
      "attributes": {
        "start_city": start,
        "end_city": finish,
        "travel_time": "impossible",
        "weather_at_eta": {
          "temperature": "",
          "conditions": ""
        }
      }
    }
  }
  end
end
