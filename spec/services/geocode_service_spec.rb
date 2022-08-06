require 'rails_helper'

RSpec.describe "Geocode API Service" do

  it "gives lat/long of city as response" do
    location = GeocodeService.city_location('dayton,oh')

    expect(location).to be_a Hash
    expect(location[:results]).to be_a Array
    expect(location[:results][0][:locations][0][:latLng][:lat]).to eq(39.760982)
    expect(location[:results][0][:locations][0][:latLng][:lng]).to eq(-84.192203)
  end

end
