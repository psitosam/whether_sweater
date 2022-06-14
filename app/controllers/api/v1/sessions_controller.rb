class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: UserSerializer.new_user_data(user), status: 201
    else
      render json: { data: { message: 'Invalid credentials'} }, status: 424
    end
  end
end
