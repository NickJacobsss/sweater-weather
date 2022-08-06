require 'rails_helper'

RSpec.describe "GeocodeFacade" do

  it "returns lat and long for a given city" do
    dayton = GeocodeFacade.city_location('dayton,oh')
    expect(dayton).to be_a Geocode 
    expect(dayton.lat).to eq(39.760982)
    expect(dayton.long).to eq(-84.192203)
  end

end
