class MapQuestFacade

  def self.find_coordinates(location)
    data = MapQuestService.location_data(location)
    coordinates = data[:results][0][:locations][0][:latLng]
    Location.new(coordinates)
  end
end
