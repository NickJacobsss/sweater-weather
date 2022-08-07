require 'rails_helper'

RSpec.describe RoadTrip do

  it "can create a roadtrip object under 24 hour route" do
    json_route = JSON.parse(File.read('spec/fixtures/long_route_example.json'), symbolize_names: true)
    route = Route.new(json_route)

    json_forecast = JSON.parse(File.read('spec/fixtures/forecast_example.json'), symbolize_names: true)

    forecast_hourly = json_forecast[:hourly].map do |hourly|
      HourlyWeather.new(hourly)
    end

    forecast_daily = json_forecast[:daily].map do |daily|
      DailyWeather.new(daily)
    end

    forecast = {
      hourly: forecast_hourly,
      daily: forecast_daily
    }

    road_trip = RoadTrip.new(route, forecast)
    expect(road_trip.finished_forecast.class).to eq(HourlyWeather)
  end

  it "can create a roadtrip object over 24 hours route" do
    json_route = JSON.parse(File.read('spec/fixtures/multiple_day_route.json'), symbolize_names: true)
    route = Route.new(json_route)

    json_forecast = JSON.parse(File.read('spec/fixtures/forecast_example.json'), symbolize_names: true)

    forecast_hourly = json_forecast[:hourly].map do |hourly|
      HourlyWeather.new(hourly)
    end

    forecast_daily = json_forecast[:daily].map do |daily|
      DailyWeather.new(daily)
    end

    forecast = {
      hourly: forecast_hourly,
      daily: forecast_daily
    }
    road_trip = RoadTrip.new(route, forecast)
    expect(road_trip.finished_forecast.class).to eq(DailyWeather)

  end
end
