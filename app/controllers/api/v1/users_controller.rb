class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if params[:email].nil? || params[:password].nil? || params[:password_confirmation].nil?
      render json: SadpathSerializer.incomplete_fields, status: :bad_request
    elsif User.find_by(email: user.email)
      render json: SadpathSerializer.email_in_use, status: :bad_request
    elsif params[:password] != params[:password_confirmation]
      render json: SadpathSerializer.password_mismatch, status: :bad_request
    elsif user.save
      user.api_key = SecureRandom.hex(15)
      render json: UserSerializer.new_user_data(user), status: 201
    end
  end
  
  private
    def user_params
      params.permit(:email, :password, :password_confirmation, :api_key)
    end
end
