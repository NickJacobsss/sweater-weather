require 'rails_helper'

RSpec.describe HourlyWeather do

  it "creates object from JSON with hourly weather" do
    forecast = JSON.parse(File.read('spec/fixtures/forecast_example.json'), symbolize_names: true)
    hourly_weather = HourlyWeather.new(forecast[:hourly][0])
    expect(hourly_weather.conditions).to eq("Rain")
    expect(hourly_weather.icon).to eq("10d")
    expect(hourly_weather.temp).to eq(83.86)
    expect(hourly_weather.time).to eq("13:00")
  end

end
