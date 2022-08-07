class Route
  attr_reader :seconds, :unformatted_time

  def initialize(route_data)
    @seconds = route_data[:route][:realTime]
    @unformatted_time = route_data[:route][:formattedTime]
  end

  def formatted_time
    unformatted = @unformatted_time.split(":")
    if unformatted[0] == "00"
      formatted_time = "#{unformatted[1]} Minutes"
    else
      formatted_time = "#{unformatted[0]} Hours, #{unformatted[1]} Minutes"
    end
    return formatted_time
  end

  def total_hours
    @seconds / 3600
  end
end
