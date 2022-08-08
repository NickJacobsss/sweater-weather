require 'rails_helper'

RSpec.describe "Forecast Request" do
  describe "happy paths" do
    it "returns a forecast when given a city and state", :vcr do
      header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      location = 'dayton,oh'

      get '/api/v1/forecast', headers: header, params: {location: location}

      expect(response).to be_successful

      forecast = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(forecast).to include(:id,:type,:attributes)
      expect(forecast[:attributes]).to include(:current_weather,:daily_weather,:hourly_weather)
      expect(forecast[:attributes][:current_weather]).to include(:datetime,:sunrise,:sunset,:temperature,:feels_like,:humidity,:uvi,:visibility,:conditions,:icon)
      expect(forecast[:attributes][:current_weather][:datetime]).to be_a String
      expect(forecast[:attributes][:current_weather][:sunrise]).to be_a String
      expect(forecast[:attributes][:current_weather][:sunset]).to be_a String
      expect(forecast[:attributes][:current_weather][:temperature]).to be_a Float
      expect(forecast[:attributes][:current_weather][:feels_like]).to be_a Float
      expect(forecast[:attributes][:current_weather][:humidity]).to be_a Integer
      expect(forecast[:attributes][:current_weather][:visibility]).to be_a Integer
      expect(forecast[:attributes][:current_weather][:conditions]).to be_a String

      expect(forecast[:attributes][:daily_weather].first).to include(:date,:sunrise,:sunset,:max_temp,:min_temp,:conditions,:icon)
      expect(forecast[:attributes][:daily_weather].first[:date]).to be_a String
      expect(forecast[:attributes][:daily_weather].first[:sunrise]).to be_a String
      expect(forecast[:attributes][:daily_weather].first[:sunset]).to be_a String
      expect(forecast[:attributes][:daily_weather].first[:max_temp]).to be_a Float
      expect(forecast[:attributes][:daily_weather].first[:min_temp]).to be_a Float
      expect(forecast[:attributes][:daily_weather].first[:conditions]).to be_a String
      expect(forecast[:attributes][:daily_weather].first[:icon]).to be_a String

      expect(forecast[:attributes][:hourly_weather].first).to include(:time,:temperature,:conditions,:icon)
      expect(forecast[:attributes][:hourly_weather].first[:time]).to be_a String
      expect(forecast[:attributes][:hourly_weather].first[:temperature]).to be_a Float
      expect(forecast[:attributes][:hourly_weather].first[:conditions]).to be_a String
      expect(forecast[:attributes][:hourly_weather].first[:icon]).to be_a String

      expect(forecast[:attributes][:hourly_weather].first).to_not have_key :sunset
      expect(forecast[:attributes][:hourly_weather].first).to_not have_key :sunrise

      expect(forecast[:attributes][:daily_weather].first).to_not have_key :humidity
      expect(forecast[:attributes][:daily_weather].first).to_not have_key :visibility

      expect(forecast[:attributes][:current_weather]).to_not have_key :max_temp
      expect(forecast[:attributes][:current_weather]).to_not have_key :min_temp
    end
  end

  describe "sad paths" do
    it "returns an error message when no location is passed", :vcr do
      header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }

      get '/api/v1/forecast', headers: header
      error = JSON.parse(response.body, symbolize_names: true)
      expect(error[:error]).to eq("please enter city & state")
    end
  end
end
