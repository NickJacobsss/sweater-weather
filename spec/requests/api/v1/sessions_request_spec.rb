require 'rails_helper'

RSpec.describe "Login Request" do
  before :each do
    create_header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    create_body = {
      "email": "nickee@nick.com",
      "password": "password",
      "password_confirmation": "password"
    }
    post '/api/v1/users', headers: create_header, params: JSON.generate(create_body)
  end

  describe "happy path" do
    it "returns a users information if credentials are correct", :vcr do
      login_header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      login_body = {
        "email": "nickee@nick.com",
        "password": "password" }

      post '/api/v1/sessions', headers: login_header, params: JSON.generate(login_body)
      logged_user = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response).to be_successful
      expect(logged_user).to include(:type,:id,:attributes)
      expect(logged_user[:attributes]).to include(:email,:api_key)

      expect(logged_user).to_not have_key(:password)
      expect(logged_user).to_not have_key(:password_confirmation)
      expect(logged_user).to_not have_key(:password_digest)
    end
  end

  describe "sad path" do
    it "returns an error when email doesnt exist", :vcr do
      login_header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      login_body = {
        "email": "nickeeeeeee@nick.com",
        "password": "password" }

      post '/api/v1/sessions', headers: login_header, params: JSON.generate(login_body)
      error = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(error[:error]).to eq("Invalid Credentials, Try Again")
    end

    it "returns an error when password is incorrect", :vcr do
      login_header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      login_body = {
        "email": "nickee@nick.com",
        "password": "password123" }

      post '/api/v1/sessions', headers: login_header, params: JSON.generate(login_body)
      error = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(error[:error]).to eq("Invalid Credentials, Try Again")
    end
  end
end
