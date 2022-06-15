require 'rails_helper'

RSpec.describe 'the road trip poro' do
  it 'exists and has readable attributes' do
    to = "denver,co"
    from = "washington,dc"
    road_trip = RoadTripFacade.route(to, from)
    VCR.use_cassette('exists_and_has_readable_attributes') do
      
    expect(road_trip).to be_a(RoadTrip)
    expect(road_trip.travel_time).to be_a String
    expect(road_trip.destination_forecast).to be_a String
    expect(road_trip.destination_temp).to be_a Float
    expect(road_trip.start_city).to eq("Washington")
    expect(road_trip.end_city).to eq("Denver")
    expect(road_trip.travel_seconds).to eq(88992)
    expect(road_trip.travel_hours).to eq(24)
    end
  end
end
