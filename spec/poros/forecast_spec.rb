require 'rails_helper'

RSpec.describe Forecast do
  it 'exists and has readable attributes' do
    data = OpenWeatherService.weather_data(37.541290, -77.434769)
    forecast = Forecast.new(data)

    expect(forecast).to be_a Forecast
    expect(forecast.current).to be_a CurrentForecast
    forecast.daily.each do |day|
      expect(day).to be_a DailyForecast
    end
    forecast.hourly.each do |hour|
    expect(hour).to be_a HourlyForecast
    end
  end
end
# Forecast is made up of three components so that it is easier to deliver the necessary data as three different objects that populate the JSON response hash fields.
# Forecast.daily is an array of hashes, each hash being a day in the 5 day forecast
# Forecast.hourly follows the same logic but for an 8 hour forecast 
