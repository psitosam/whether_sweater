class OpenWeatherService

  def self.weather_data(lat, lon)
    response = conn.get("/data/2.5/onecall") do |r|
      r.params['lat'] = lat
      r.params['lon'] = lon
      r.params['units'] = 'imperial'
      r.params['exclude'] = 'minutely'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

    def self.conn
      Faraday.new("https://api.openweathermap.org", params: {appid: ENV['weather_key']})
    end
end
