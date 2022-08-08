require 'rails_helper'

RSpec.describe "ForecastFacade" do

  it "returns current, hourly, and daily forecasts given a lat/long", :vcr do
    dayton_forecast = ForecastFacade.get_forecast(39.760982,-84.192203)

    expect(dayton_forecast).to include(:current,:daily,:hourly)
    expect(dayton_forecast).to be_a Hash
    expect(dayton_forecast[:daily]).to be_a Array
    expect(dayton_forecast[:hourly]).to be_a Array

    expect(dayton_forecast[:current]).to be_a CurrentWeather
    expect(dayton_forecast[:daily][0]).to be_a DailyWeather
    expect(dayton_forecast[:hourly][0]).to be_a HourlyWeather
  end

end
