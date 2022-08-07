require "rails_helper"

RSpec.describe Route do

  it "creates a route object from JSON response" do
    json = JSON.parse(File.read('spec/fixtures/short_route_example.json'), symbolize_names: true)
    route = Route.new(json)
    expect(route.seconds).to eq(112)
    expect(route.unformatted_time).to eq("00:01:52")
    expect(route.total_hours).to eq(0)
  end

  it "only shows minutes if less than 1 hour" do
    json = JSON.parse(File.read('spec/fixtures/short_route_example.json'), symbolize_names: true)
    route = Route.new(json)

    expect(route.formatted_time).to eq("01 Minutes")
  end

  it "gives hours and minutes if longer than 1 hour" do
    json = JSON.parse(File.read('spec/fixtures/long_route_example.json'), symbolize_names: true)
    route = Route.new(json)
    expect(route.formatted_time).to eq("13 Hours, 52 Minutes")
  end

  it "gives total hours of trip as integer" do
    json = JSON.parse(File.read('spec/fixtures/long_route_example.json'), symbolize_names: true)
    route = Route.new(json)

    expect(route.total_hours).to eq(13)
  end
end
