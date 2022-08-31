class Api::V1::RoadTripsController < ApplicationController

  before_action :require_valid_api_key!

  def create
    to, from = params[:destination], params[:origin]
    result = RoadTripFacade.route(to, from)

    if result != [] 
      render json: RoadTripSerializer.road_trip_new(result)
    else
      render json: SadpathSerializer.bad_road_trip(to, from)
    end 
  end


  private 

  def require_valid_api_key!
    unless signed_in?
      render json: SadpathSerializer.bad_api_key, status: 401
    end 
  end 

  def signed_in?
    User.exists?(api_key: params[:api_key])
  end 
end
