class Api::V1::RoadTripsController < ApplicationController

  def create
    to = params[:destination]
    from = params[:origin]
    api_key = params[:api_key]
    # require 'pry'; binding.pry
    if User.find_by(api_key: api_key)
      road_trip = RoadTripFacade.route(to, from)
      if road_trip.is_a?(RoadTrip)
        render json: RoadTripSerializer.road_trip_new(road_trip)
      else
      render json: SadpathSerializer.bad_road_trip(to, from)
      end
    else
      render json: SadpathSerializer.bad_api_key, status: 401
    end
  end
end
