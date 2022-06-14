class Api::V1::BreweriesController < ApplicationController
  before_action :get_location

  def index
    location = params[:location]
    quantity = params[:quantity].to_i
    forecast = OpenWeatherFacade.find_forecast(@location.latitude, @location.longitude)
    breweries = BreweryFacade.find_breweries(location)
    if quantity > 0
      render json: BreweriesSerializer.brewery_response(forecast, breweries, location, quantity)
    else
      return invalid_quantity
    end
  end

  private

    def get_location
      if params[:location].present?
        @location = MapQuestFacade.find_coordinates(params[:location])
      else
        render json: { data: { message: 'bad request'} }, status: 404
      end
    end

    def invalid_quantity
      render json: { data: { message: 'Invalid quantity'} }, status: 404
    end
end
