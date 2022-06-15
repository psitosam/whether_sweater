class RoadTripService

  def self.conn
    url = "http://www.mapquestapi.com/directions/v2/route"
    Faraday.new(url: url,) do |f|
      f.params['key'] = ENV['mapquest_key']
    end
  end

  def self.get_road_trip(destination, origin)
    response = conn.get do |r|
      r.params['from'] = origin
      r.params['to'] = destination
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
