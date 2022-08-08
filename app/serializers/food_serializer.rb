class FoodSerializer

  def self.format_food(food, forecast, location)
    binding.pry
    {
      "data": {
        "id": "null",
        "type": "munchie",
        "attributes": {
          "destination_city": location,
          "forecast": {
            "summary": forecast[:current].conditions,
            "temperature": forecast[:current].temperature
          },
          "restaurant": {
            "name": food.name,
            "address": food.address
          }
        }
      }
    }
  end
end
