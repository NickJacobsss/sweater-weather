require 'rails_helper'

RSpec.describe Food do

  it "creates a food object when passed location and type of food" do
    food_data = JSON.parse(File.read('spec/fixtures/food_example.json'), symbolize_names: true)
    food_object = Food.new(food_data[:businesses])

    expect(food_object.name).to eq("Kung Fu Noodle")
    expect(food_object.address).to eq("2801 S Dixie Dr, Ste 3, Dayton, OH 45409")
  end

end
