require "rails_helper"

RSpec.describe "Forecast API Service " do

  it 'gives forecast for lat/long of city' do
    forecast = ForecastService.forecast(39.760982,-84.192203)
    expect(forecast).to have_key :current
    expect(forecast).to have_key :daily
    expect(forecast).to have_key :hourly
  end

end
