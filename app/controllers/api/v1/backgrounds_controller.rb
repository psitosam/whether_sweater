class Api::V1::BackgroundsController < ApplicationController

  def index
    if params[:location]
      image = UnsplashImageFacade.find_image(params[:location])
      render json: BackgroundSerializer.format_background(image)
    else
      render json: { data: { message: 'bad request' } }, status: 400
    end
  end
end
