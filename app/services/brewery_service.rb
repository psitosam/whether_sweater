class BreweryService

  def self.conn
    url = "https://api.openbrewerydb.org/breweries"
    Faraday.new(url: url)
  end

  def self.get_breweries(location)
    response = conn.get do |r|
      r.params['by_city'] = location
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
