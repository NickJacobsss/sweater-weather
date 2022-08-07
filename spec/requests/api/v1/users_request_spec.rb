require 'rails_helper'

RSpec.describe "User Create Request" do
  describe "happy path" do
    it "creates and returns a new user if all requirements are met" do
      header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      body = {
        "email": "nickee@nick.com",
        "password": "password",
        "password_confirmation": "password"
      }

      post '/api/v1/users', headers: header, params: JSON.generate(body)
      new_user = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response).to be_successful
      expect(new_user).to include(:type,:id,:attributes)
      expect(new_user[:attributes]).to include(:email,:api_key)

      expect(new_user).to_not have_key(:password)
      expect(new_user).to_not have_key(:password_confirmation)
      expect(new_user).to_not have_key(:password_digest)
    end
  end

  describe "sad path" do
    it "gives an error when passwords do not match " do
      header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      body = {
        "email": "nickee@nick.com",
        "password": "password1",
        "password_confirmation": "password"
      }
      post '/api/v1/users', headers: header, params: JSON.generate(body)

      error = JSON.parse(response.body, symbolize_names: true)
      expect(error[:error]).to eq("Password confirmation doesn't match Password")
    end

    it "gives an error when missing a field" do
      header = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      body = {
        "password": "password",
        "password_confirmation": "password"
      }
      post '/api/v1/users', headers: header, params: JSON.generate(body)

      error = JSON.parse(response.body, symbolize_names: true)
      expect(error[:error]).to eq("Email can't be blank")
    end
  end
end
