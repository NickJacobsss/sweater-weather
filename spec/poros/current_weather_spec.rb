require 'rails_helper'

RSpec.describe CurrentWeather do

  it "creates object from JSON with current weather" do
    forecast = JSON.parse(File.read('spec/fixtures/forecast_example.json'), symbolize_names: true)
    current_weather = CurrentWeather.new(forecast)
    expect(current_weather).to be_a CurrentWeather
    expect(current_weather.conditions).to eq("broken clouds")
    expect(current_weather.datetime).to eq("2022-08-06 13:44:06 -0500")
    expect(current_weather.feels_like).to eq(91.92)
    expect(current_weather.humidity).to eq(77)
    expect(current_weather.icon).to eq("04d")
    expect(current_weather.sunrise).to eq("2022-08-06 05:40:22 -0500")
    expect(current_weather.sunset).to eq("2022-08-06 19:44:57 -0500")
    expect(current_weather.temperature).to eq(83.62)
    expect(current_weather.uvi).to eq(6.56)
    expect(current_weather.visibility).to eq(10000)
  end
end
