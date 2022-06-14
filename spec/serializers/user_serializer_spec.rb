require 'rails_helper'

RSpec.describe 'the user serializer' do

  it 'serializes user info into json' do
    user = User.create!(email: 'testemail@test.test', password_digest: 'password123')
    json = JSON.parse(UserSerializer.new_user_data(user).to_json, symbolize_names: true)

    expect(json).to be_a Hash
    expect(json).to have_key(:data)
    expect(json[:data]).to have_key(:type)
    expect(json[:data][:type]).to eq('user')
    expect(json[:data]).to have_key(:id)
    expect(json[:data][:id]).to eq(user.id)
    expect(json[:data]).to have_key(:attributes)
    expect(json[:data][:attributes]).to have_key(:email)
    expect(json[:data][:attributes][:email]).to eq(user.email)
    expect(json[:data][:attributes]).to have_key(:api_key)
    expect(json[:data][:attributes][:api_key]).to eq(user.api_key)
  end
end
