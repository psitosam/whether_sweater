require 'rails_helper'

RSpec.describe 'the forecast endpoint', :vcr do
  it 'gets weather for a given city' do
    get '/api/v1/forecast', params: { location: 'richmond,va' }
    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(forecast).to be_a Hash
    expect(forecast).to have_key(:data)
    expect(forecast[:data]).to have_key(:id)
    expect(forecast[:data]).to have_key(:type)
    expect(forecast[:data]).to have_key(:attributes)
    expect(forecast[:data][:attributes]).to have_key(:current_weather)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:datetime)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:temp)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:feels_like)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:humidity)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:uvi)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:visibility)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:conditions)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:icon)
    expect(forecast[:data][:attributes]).to have_key(:daily_weather)
    # Daily weather is an array of hashes, each hash is a day :
    expect(forecast[:data][:attributes][:daily_weather].count).to eq(5)
    expect(forecast[:data][:attributes][:daily_weather][0]).to be_a Hash
    # Daily weather needs 7 attributes :
    expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:datetime)
    expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:sunrise)
    expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:sunset)
    expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:max_temp)
    expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:min_temp)
    expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:conditions)
    expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:icon)
    expect(forecast[:data][:attributes]).to have_key(:hourly_weather)
    # checking for absence of things we dont want :
    expect(forecast[:data][:attributes]).to_not have_key(:minutely)
    # Hourly weather is an array of 8 elements for the 8 hours we want :
    expect(forecast[:data][:attributes][:hourly_weather].count).to eq(8)
    # Each hour needs time, temp, conditions, and icon :
    expect(forecast[:data][:attributes][:hourly_weather][0]).to have_key(:time)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to have_key(:temp)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to have_key(:conditions)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to have_key(:icon)
    # Checking for things we dont want in current weather :
    expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:wind_speed)
    expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:wind_deg)
    expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:wind_gust)
    expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:pressure)
    expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:dew_point)
    # Checking for things we dont want in daily weather :
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:moonrise)
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:moonset)
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:moon_phase)
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:pressure)
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:dew_point)
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:wind_deg)
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:wind_speed)
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:wind_gust)
    # Checking for things we dont want in hourly weather :
    expect(forecast[:data][:attributes][:hourly_weather][0]).to_not have_key(:moonrise)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to_not have_key(:moonset)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to_not have_key(:moon_phase)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to_not have_key(:pressure)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to_not have_key(:dew_point)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to_not have_key(:wind_deg)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to_not have_key(:wind_speed)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to_not have_key(:wind_gust)
  end

  it 'returns an error when given invalid params', :vcr do
    get '/api/v1/forecast', params: { weather: "richmond,va" }

    expect(response.status).to eq(404)
  end
end
