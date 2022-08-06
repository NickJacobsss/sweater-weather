class Geocode
  attr_reader :lat, :long

  def initialize(geo_data)
    @lat = geo_data[:results][0][:locations][0][:latLng][:lat]
    @long = geo_data[:results][0][:locations][0][:latLng][:lng]
  end

end
