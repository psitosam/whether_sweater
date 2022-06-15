class Api::V1::RoadTripsController < ApplicationController
  before_action :validate_user_api_key

  def create
    to = params[:destination]
    from = params[:origin]
    road_trip = RoadTripFacade.new_road_trip(to, from)
    if road_trip[:info][:statuscode] == 402
      render json: SadpathSerializer.bad_road_trip(to, from)
    elsif
      coordinates = road_trip[:route][:locations][1][:latLng]
      forecast = OpenWeatherFacade.find_forecast(latLng[:lat], latLng[:lng])
      render json: RoadTripSerializer.road_trip_new(road_trip, forecast)
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
