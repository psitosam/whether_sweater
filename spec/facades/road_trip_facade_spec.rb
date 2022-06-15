require 'rails_helper'

RSpec.describe RoadTripFacade do

  it 'new_road_trip' do
    origin = 'washington,dc'
    destination = 'denver,co'
    road_trip = RoadTripFacade.route(destination, origin)

    expect(road_trip).to be_a RoadTrip
  end

  it 'can detect an impossible route' do
    origin = 'washington,dc'
    destination = 'honolulu,hi'
    road_trip = RoadTripFacade.route(destination, origin)

    expect(road_trip).to_not be_a RoadTrip
  end
end
