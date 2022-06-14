require 'rails_helper'

RSpec.describe 'the user request' do
  it 'returns json' do
    data = {
      "email": "test@testmail.com",
      "password": "password",
      "password_confirmation": "password"
    }

    post '/api/v1/users', params: data

    user = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(201)
    expect(user[:data]).to have_key(:type)
    expect(user[:data]).to have_key(:id)
    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes]).to have_key(:api_key)
    expect(user[:data][:attributes]).to_not have_key(:password)
    expect(user[:data][:attributes]).to_not have_key(:password_confirmation)
  end

  it 'returns 400 when given invalid attributes' do
    data = {
      "email": "test@testmail.com",
      "password": "pass",
      "password_confirmation": "password"
    }
    post '/api/v1/users', params: data

    expect(response.status).to eq(400)

    error = JSON.parse(response.body, symbolize_names: true)

    expect(error[:data][:message]).to eq('Passwords must match')
  end
end
