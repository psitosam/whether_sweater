require 'rails_helper'

RSpec.describe RoadTripFacade do

  it 'new_road_trip' do
    origin = 'washington,dc'
    destination = 'denver,co'
    road_trip = RoadTripFacade.new_road_trip(destination, origin)
    VCR.use_cassette('new_road_trip') do

    expect(road_trip).to be_a Hash
    expect(road_trip).to have_key(:route)
    expect(road_trip[:route]).to have_key(:formattedTime)
    expect(road_trip[:route]).to have_key(:locations)
    expect(road_trip[:route][:locations]).to be_a Array
    end
  end
end
