require 'rails_helper'

RSpec.describe "Road Trip Request" do
  before :each do
    user = User.create!({
      email: "nickee@nick.com",
      password: "password",
      password_confirmation: "password",
      api_key: "9045b968bda19b3ac8c6bc565be901e2"
    })
  end

  describe "happy path" do
    it "returns road trip info including weather and travel time ", :vcr do
      header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      body = {
        "origin": "dayton, oh",
        "destination": "baton rouge, la",
        "api_key": "9045b968bda19b3ac8c6bc565be901e2"
      }

      post "/api/v1/roadtrip", headers: header, params: JSON.generate(body)
      road_trip = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(road_trip[:id]).to eq("null")
      expect(road_trip[:type]).to eq("roadtrip")
      expect(road_trip[:attributes]).to include(:start_city,:end_city,:travel_time,:weather_at_eta)
      expect(road_trip[:attributes][:weather_at_eta]).to include(:temperature,:conditions)
    end
  end

  describe "sad path" do
    it "returns an error when api key does not match a user ", :vcr do
      header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      body = {
        "origin": "dayton, oh",
        "destination": "baton rouge, la",
        "api_key": "12345"
      }

      post "/api/v1/roadtrip", headers: header, params: JSON.generate(body)
      road_trip = JSON.parse(response.body, symbolize_names: true)
      expect(road_trip[:error]).to eq("Unauthorized API Key")
    end

    it "returns an impossible route JSON if route is impossible", :vcr do
      header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      body = {
        "origin": "dayton, oh",
        "destination": "London,UK",
        "api_key": "9045b968bda19b3ac8c6bc565be901e2"
      }

      post "/api/v1/roadtrip", headers: header, params: JSON.generate(body)
      road_trip = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(road_trip[:attributes][:start_city]).to eq("dayton, oh")
      expect(road_trip[:attributes][:end_city]).to eq("London,UK")
      expect(road_trip[:attributes][:weather_at_eta][:temperature]).to eq("")
      expect(road_trip[:attributes][:weather_at_eta][:conditions]).to eq("")
    end
  end

end
