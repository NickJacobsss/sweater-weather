class FoodService

  def self.connection
    Faraday.new(url: "https://api.yelp.com/v3/businesses/search", headers: {'Authorization'=>'Bearer 4bpKVNSgdtglHQNI8B-F3PXmUBhNUjO3-stuQObuO9gkCx_rHosMahLY921_X8j4ySwZIJo7rLBADoBt4QIAaSb1vXdfA0mfnRJpJ4Vf36gh24cD00D8E8ZZ0CTxYnYx'})
  end

  def self.get_food(location, food)
    response = connection.get do |p|
      p.params[:location] = location
      p.params[:term] = food
    end
    JSON.parse(response.body, symbolize_names: true)[:businesses]
  end

end
