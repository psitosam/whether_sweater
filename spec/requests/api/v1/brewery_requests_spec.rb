require 'rails_helper'

RSpec.describe 'the breweries request' do
  it 'returns json response' do
    params = { location: 'richmond', quantity: 5 }

    get '/api/v1/breweries', params: params
    VCR.use_cassette('returns_json_response') do
    brewery_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(brewery_response).to have_key(:data)
    expect(brewery_response[:data]).to have_key(:id)
    expect(brewery_response[:data]).to have_key(:type)
    expect(brewery_response[:data]).to have_key(:attributes)
    expect(brewery_response[:data][:attributes]).to have_key(:destination)
    expect(brewery_response[:data][:attributes][:destination]).to eq("richmond")
    expect(brewery_response[:data][:attributes]).to have_key(:forecast)
    expect(brewery_response[:data][:attributes][:forecast]).to have_key(:summary)
    expect(brewery_response[:data][:attributes][:forecast]).to have_key(:temperature)
    expect(brewery_response[:data][:attributes]).to have_key(:breweries)
    expect(brewery_response[:data][:attributes][:breweries]).to be_a Array
    expect(brewery_response[:data][:attributes][:breweries].length).to eq(5)
    brewery_response[:data][:attributes][:breweries].each do |brewery|
      expect(brewery).to have_key(:id)
      expect(brewery).to have_key(:name)
      expect(brewery).to have_key(:brewery_type)
    end
  end
  end
end
