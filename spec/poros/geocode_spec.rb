require 'rails_helper'

RSpec.describe Geocode do

  it "creates a geocode object with lat long" do
    data = GeocodeService.city_location('dayton,oh')
    dayton = Geocode.new(data)

    expect(dayton.lat).to eq(39.760982)
    expect(dayton.long).to eq(-84.192203)
  end

end
