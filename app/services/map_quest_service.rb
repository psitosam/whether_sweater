class MapQuestService

  def self.location_data(location)
    response = conn.get("/geocoding/v1/address") do |r|
      r.params['location'] = location
    end
    body = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_route(to, from)
    response = conn.get("/directions/v2/route") do |r|
      r.params['from'] = from
      r.params['to'] = to
    end
    body = JSON.parse(response.body, symbolize_names: true)
  end

  private

    def self.conn
      Faraday.new("http://www.mapquestapi.com") do |r|
        r.params['key'] = ENV['mapquest_key']
      end
    end
end
