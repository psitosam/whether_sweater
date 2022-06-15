require 'rails_helper'

RSpec.describe 'the road trip request' do
  it 'retrieves route and forecast information for a road trip' do

    user = User.create!({ email: 'test@testemail.test', password: 'supersecret', api_key: '75fb908a28ee7690ff8c2d8c2c5fdb'})
    data = {
      "origin": 'washington,dc',
      "destination": 'denver,co',
      "api_key": '75fb908a28ee7690ff8c2d8c2c5fdb'
    }
    post '/api/v1/road_trip', params: data
    VCR.use_cassette('retrieves_route_and_forecast_information_for_a_road_trip') do
    expect(response).to be_successful

    road_trip = JSON.parse(response.body, symbolize_names: true)

    expect(road_trip).to be_a Hash
    expect(road_trip).to have_key(:data)
    expect(road_trip[:data]).to have_key(:id)
    expect(road_trip[:data][:id]).to eq(nil)
    expect(road_trip[:data][:type]).to eq("roadtrip")
    expect(road_trip[:data][:attributes]).to have_key(:start_city)
    expect(road_trip[:data][:attributes]).to have_key(:end_city)
    expect(road_trip[:data][:attributes]).to have_key(:travel_time)
    expect(road_trip[:data][:attributes]).to have_key(:weather_at_eta)
    expect(road_trip[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(road_trip[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
    end
  end

  it 'sadpath returns appropriate error message' do
    user = User.create!({ email: 'test@testemail.test', password: 'supersecret', api_key: '75fb908a28ee7690ff8c2d8c2c5fdb'})
    data = {
      "origin": 'washington,dc',
      "destination": 'denver,co',
      "api_key": ''
    }

    post '/api/v1/road_trip', params: data
    
    expect(response).to_not be_successful
    sadpath = JSON.parse(response.body, symbolize_names: true)
    expect(sadpath[:data][:message]).to eq('Invalid api key')
  end
end
