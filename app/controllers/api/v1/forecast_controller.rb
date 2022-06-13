class Api::V1::ForecastController < ApplicationController
  before_action :get_location

  def index
    forecast = OpenWeatherFacade.find_forecast(@location.latitude, @location.longitude)
    render json: ForecastSerializer.new_forecast(forecast)
  end



  def get_location
    if params[:location]
      @location = MapQuestFacade.find_coordinates(params[:location])
    else
      render json: { error: 'bad request' }, status: 404
    end
  end
end
