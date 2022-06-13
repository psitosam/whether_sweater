class OpenWeatherFacade
  def self.find_forecast(latitude, longitude)
    data = OpenWeatherService.weather_data(latitude, longitude)
    Forecast.new(data)
  end
end
