require 'rails_helper'

RSpec.describe 'the brewery service' do
  it 'returns a Faraday connection' do
    conn = BreweryService.conn
    expect(conn).to be_a(Faraday::Connection)
  end

  it 'returns breweries from a given location' do
    location = "richmond"
    response = BreweryService.get_breweries(location)
    VCR.use_cassette('returns_breweries_from_a_given_location') do

    expect(response).to be_a Array
    response.each do |brewery|
      expect(brewery).to have_key(:id)
      expect(brewery).to have_key(:name)
      expect(brewery).to have_key(:brewery_type)
      expect(brewery).to have_key(:city)
      expect(brewery).to have_key(:state)
    end
  end 
  end
end
