require 'rails_helper'

RSpec.describe 'the session endpoint' do
  it 'happy path creates a session' do
    user_1 = User.create!(email: "test_1@testmail.test", password: "supersecret", password_confirmation: "supersecret")

    login_info = { "email": "test_1@testmail.test", "password": "supersecret"}

    post '/api/v1/sessions', params: login_info
    expect(response.status).to eq(201)

    user = JSON.parse(response.body, symbolize_names: true)


    expect(user).to be_a Hash
    expect(user).to have_key(:data)
    expect(user[:data]).to have_key(:type)
    expect(user[:data][:type]).to eq('user')
    expect(user[:data]).to have_key(:id)
    expect(user[:data][:id]).to eq(user_1.id)
    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes][:email]).to eq(user_1.email)
    expect(user[:data][:attributes]).to have_key(:api_key)
    expect(user[:data][:attributes][:api_key]).to eq(user_1.api_key)
  end

  it 'sad path returns appropriate message if given bad credentials' do
    user_1 = User.create!(email: "test_1@testmail.test", password: "supersecret", password_confirmation: "supersecret")

    bad_login_info = { "email": "test_1@testmail.test", "password": "notsupersecret"}

    post '/api/v1/sessions', params: bad_login_info
    expect(response.status).to eq(424)

    error = JSON.parse(response.body, symbolize_names: true)
    
    expect(error[:data][:message]).to eq('Invalid credentials')

  end
end
