require 'rails_helper'

RSpec.describe "FoodFacade" do
  describe "happy path" do
    it "returns relevant food info", :vcr do
      food_data = FoodFacade.get_info("dayton, oh", "chinese food")
      expect(food_data.name).to eq("Kung Fu Noodle")
      expect(food_data.address).to eq("2801 S Dixie Dr, Ste 3, Dayton, OH 45409")
    end
  end
end
