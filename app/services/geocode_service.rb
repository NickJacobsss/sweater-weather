class GeocodeService

  def self.connection
    Faraday.new(url: 'http://www.mapquestapi.com/geocoding/v1/address?') do |form|
       form.params['key'] = ENV['MAPQUEST_API_KEY']
     end
   end

   def self.city_location(city)
     response = connection.get do |form|
       form.params['location'] = city
     end
     JSON.parse(response.body, symbolize_names: true)
   end
end
