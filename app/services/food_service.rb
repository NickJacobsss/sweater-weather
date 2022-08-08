class FoodService

  def self.connection
    Faraday.new(url: "https://api.yelp.com/v3/businesses/search", headers: {'Authorization'=>ENV['YELP_API_KEY']})
  end

  def self.get_food(location, food)
    response = connection.get do |p|
      p.params[:location] = location
      p.params[:term] = food
    end
    JSON.parse(response.body, symbolize_names: true)[:businesses]
  end

end
