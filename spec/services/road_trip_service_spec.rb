require 'rails_helper'

RSpec.describe RoadTripService do
  it 'returns a faraday response' do
    conn = RoadTripService.conn
    expect(conn).to be_a(Faraday::Connection)
  end

  it 'returns road trip data from origin and destination' do
    destination = 'denver,co'
    origin = 'washington,dc'
    road_trip = RoadTripService.get_road_trip(destination, origin)
    
    VCR.use_cassette('returns_road_trip_data_from_origin_and_destination') do
    expect(road_trip).to be_a Hash
    expect(road_trip).to have_key(:route)
    expect(road_trip[:route]).to have_key(:formattedTime)
    expect(road_trip[:route]).to have_key(:locations)
    expect(road_trip[:route][:locations]).to be_a Array
  end
  end
end
