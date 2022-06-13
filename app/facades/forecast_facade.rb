class ForecastFacade
  def self.find_forecast(lat, lon)
    json = OpenWeatherService.weather_data(lat, lon)
  end
end
