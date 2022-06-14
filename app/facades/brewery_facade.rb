class BreweryFacade

  def self.find_breweries(location)
    json = BreweryService.get_breweries(location)
  end
end
