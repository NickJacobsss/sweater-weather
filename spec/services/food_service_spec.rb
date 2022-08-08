require 'rails_helper'

RSpec.describe "Food API Service" do

  it "gives businesses with category and location" do
    food = FoodService.get_food("dayton, oh", "chinese food")
    # expect(food.firstqq)
    expect(food.first[:name]).to be_a String
    expect(food.first[:location]).to have_key :display_address
    expect(food.first[:location][:display_address].join(" ")).to be_a String
  end

end
