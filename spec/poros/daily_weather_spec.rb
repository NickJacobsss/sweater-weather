require 'rails_helper'

RSpec.describe DailyWeather do

  it "creates object from JSON with daily weather" do
    forecast = JSON.parse(File.read('spec/fixtures/forecast_example.json'), symbolize_names: true)
    daily_weather = DailyWeather.new(forecast[:daily][0])
    expect(daily_weather.conditions).to eq("Rain")
    expect(daily_weather.date).to eq("6 Aug 2022")
    expect(daily_weather.icon).to eq("10d")
    expect(daily_weather.max_temp).to eq(83.86)
    expect(daily_weather.min_temp).to eq(68.25)
    expect(daily_weather.sunrise).to eq("05:40")
    expect(daily_weather.sunset).to eq("19:44")
  end


end
