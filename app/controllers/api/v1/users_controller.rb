class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if params[:email].nil? || params[:password].nil? || params[:password_confirmation].nil?
      render json: { error: 'All fields must be filled in'}, status: :bad_request
    elsif User.find_by(email: user.email)
      render json: { error: 'Email already in use' }, status: :bad_request
    elsif params[:password] != params[:password_confirmation]
      render json: { error: 'Passwords must match' }, status: :bad_request
    elsif user.save
      user.api_key = SecureRandom.hex
      render json: UserSerializer.new_user_data(user), status: 201
    end
  end
  #   if params[:password] == params[:password_confirmation]
  #     user = User.create!(email: params[:email], password: params[:password],)
  #     if user.save
  #       user.api_key = SecureRandom.hex(10)
  #     end
  #     render json: UserSerializer.new_user_data(user)
  #   else
  #     render status: 404
  #   end
  # end
  private
    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end
