require 'rails_helper'

RSpec.describe "Food API Service" do
  describe "happy path" do
    it "gives businesses with category and location", :vcr do
      food = FoodService.get_food("dayton, oh", "chinese food")
      expect(food.first[:name]).to be_a String
      expect(food.first[:location]).to have_key :display_address
      expect(food.first[:location][:display_address].join(" ")).to be_a String
    end
  end

  describe "sad path" do
    it "returns nil if no location/type is passed ", :vcr do
      food = FoodService.get_food("", "")
      expect(food).to eq(nil)
    end
  end
end
