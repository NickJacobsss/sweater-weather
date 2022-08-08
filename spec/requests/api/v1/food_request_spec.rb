require 'rails_helper'

RSpec.describe "Food Request" do
  
  describe "happy path" do
    it "returns food and weather information for business location" do
      get "/api/v1/munchies?location=denver,co&food=chinese"
      data = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(data[:id]).to eq("null")
      expect(data[:type]).to eq("munchie")
      expect(data[:attributes]).to include(:destination_city,:forecast,:restaurant)
      expect(data[:attributes][:forecast][:summary]).to be_a String
      expect(data[:attributes][:forecast][:temperature]).to be_a Float
      expect(data[:attributes][:restaurant][:name]).to eq("Taste of China")
      expect(data[:attributes][:restaurant][:address]).to eq("1935 Federal Blvd, Denver, CO 80204")
    end
  end

  describe "sad path" do
    it "returns an error when no food param is given " do
      get "/api/v1/munchies?location=denver,co"
      data = JSON.parse(response.body, symbolize_names: true)
      expect(data[:error]).to eq("please enter location & food type")
    end

    it "returns an error when no location param is given" do
      get "/api/v1/munchies?food=chinese"
      data = JSON.parse(response.body, symbolize_names: true)
      expect(data[:error]).to eq("please enter location & food type")
    end
  end
end
