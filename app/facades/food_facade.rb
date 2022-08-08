class FoodFacade

  def self.get_info(location, food)
    food_json = FoodService.get_food(location, food)
    Food.new(food_json)
  end

end
