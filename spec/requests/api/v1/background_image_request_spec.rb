require 'rails_helper'

RSpec.describe 'the background image endpoint' do
  it 'retrieves a background image for a location' do
    get '/api/v1/backgrounds', params: { location: 'washington,dc'}
    VCR.use_cassette('retrieves_a_background_image_for_a_location') do

    expect(response).to be_successful

    image = JSON.parse(response.body, symbolize_names: true)

    expect(image).to be_a Hash
    expect(image).to have_key(:data)
    expect(image[:data]).to be_a Hash
    expect(image[:data]).to have_key(:id)
    expect(image[:data]).to have_key(:type)
    expect(image[:data]).to have_key(:attributes)
    expect(image[:data][:attributes]).to be_a Hash
    end
  end

  it 'renders an 400 series error if not given a location' do
    get '/api/v1/backgrounds'

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
  end
end
