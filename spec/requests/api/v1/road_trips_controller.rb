class Api::V1::RoadTripsController < ApplicationController
  before_action :validate_user_api_key

  def create
    to = params[:destination]
    from = params[:origin]
    road_trip = RoadTripFacade.route(to, from)
    if road_trip.is_a?(RoadTrip)
      render json: RoadTripSerializer.road_trip_new(road_trip)
    else
      render json: SadpathSerializer.bad_road_trip(to, from)
    end
  end


  private

    def validate_user_api_key
      user = User.find_by(api_key: params[:api_key])
      if user.nil?
        render json: SadpathSerializer.bad_api_key, status: 401
      end
    end

end
