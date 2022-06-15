class RoadTripFacade

  def self.route(to, from)
    data = MapQuestService.get_route(to, from)
    # require 'pry'; binding.pry

    if data[:info][:statuscode] != 402
      destination = MapQuestService.location_data(to)
      coords = destination[:results][0][:locations][0][:latLng]
      forecast = OpenWeatherService.weather_data(coords[:lat], coords[:lng])
      road_trip = RoadTrip.new(data, forecast)
    else
      road_trip = []
    end
  end
end
# All this logic is to get the forecast data into the road trip poro so that we can check the total hours of the road trip and adjust which destination forecast and temp we call in the serializer. If the road trip evaluates to an empty array, it is not a road_trip and the controller will send the error JSON.
