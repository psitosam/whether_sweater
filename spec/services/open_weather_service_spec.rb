require 'rails_helper'

RSpec.describe 'the open weather forecast service' do
  it 'returns a Faraday connection', :vcr do
    conn = OpenWeatherService.conn
    expect(conn).to be_a(Faraday::Connection)
  end

  it 'returns forecast data from lat and long coordinates' do
    VCR.use_cassette('returns_forecast_data_from_lat_and_long_coordinates') do
    data = { :lat => 37.541290, :lon => -77.434769 }
    forecast = OpenWeatherService.weather_data(data[:lat], data[:lon])

    expect(forecast).to be_a Hash
    expect(forecast).to_not have_key(:minutely)
    expect(forecast[:current]).to have_key(:dt)
    expect(forecast[:current]).to have_key(:sunrise)
    expect(forecast[:current]).to have_key(:sunset)
    expect(forecast[:current]).to have_key(:temp)
    expect(forecast[:current]).to have_key(:feels_like)
    expect(forecast[:current]).to have_key(:humidity)
    expect(forecast[:current]).to have_key(:uvi)
    expect(forecast[:current]).to have_key(:visibility)
    expect(forecast[:current][:weather][0]).to have_key(:description)
    expect(forecast[:current][:weather][0]).to have_key(:icon)
    forecast[:daily].shift(5).each do |day|
      expect(day).to have_key(:dt)
      expect(day).to have_key(:sunrise)
      expect(day).to have_key(:sunset)
      expect(day[:temp]).to have_key(:max)
      expect(day[:temp]).to have_key(:min)
      expect(day[:weather][0]).to have_key(:description)
      expect(day[:weather][0]).to have_key(:icon)
    end
    forecast[:hourly].shift(8).each do |hour|
      expect(hour).to have_key(:dt)
      expect(hour).to have_key(:temp)
      expect(hour[:weather][0]).to have_key(:description)
      expect(hour[:weather][0]).to have_key(:icon)
    end
    end
  end
end
