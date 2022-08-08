require 'rails_helper'

RSpec.describe Food do
  before :each do
    @food_data = JSON.parse(File.read('spec/fixtures/food_example.json'), symbolize_names: true)
    @food_object = Food.new(@food_data[:businesses])
  end
  describe "happy path" do
    it "creates a food object when passed location and type of food" do
      expect(@food_object.name).to eq("Kung Fu Noodle")
      expect(@food_object.name).to eq(@food_data[:businesses].first[:name])
      expect(@food_object.address).to eq("2801 S Dixie Dr, Ste 3, Dayton, OH 45409")
    end
  end

  describe "sad path" do
    it "address is formatted properly and doesnt look the same as the json response" do
      expect(@food_object.address).to_not eq(@food_data[:businesses].first[:display_address])
    end
  end 
end
