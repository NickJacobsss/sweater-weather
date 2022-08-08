class Food
  attr_reader :name, :address

  def initialize(food_data)
    @name = food_data.first[:name]
    @address = food_data.first[:location][:display_address].join(", ")
  end

end
