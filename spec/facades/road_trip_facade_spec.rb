require 'rails_helper'

RSpec.describe "Road Trip Facade" do
  it "returns roadtrip object with forecast data for destination" do
    road_trip = RoadTripFacade.get_future_forecast("dayton, OH", "Baton Rouge, LA")

    expect(road_trip).to be_a RoadTrip
    expect(road_trip.finished_forecast).to be_a Hash
    expect(road_trip.travel_time).to be_a String
  end
end
