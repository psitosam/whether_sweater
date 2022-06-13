require 'rails_helper'

RSpec.describe 'the mapquest service' do
  it 'returns a Faraday connection', :vcr do
    conn = MapQuestService.conn
    expect(conn).to be_a(Faraday::Connection)
  end

  it 'returns latitude and longitude' do
    coords = MapQuestService.location_data("Washington,DC")

    expect(coords).to be_a Hash
    expect(coords[:results]).to be_a Array
    expect(coords[:results][0]).to be_a Hash
    expect(coords[:results][0][:locations]).to be_a Array
    expect(coords[:results][0][:locations][0][:latLng]).to have_key(:lat)
    expect(coords[:results][0][:locations][0][:latLng]).to have_key(:lng)
    expect(coords[:results][0][:locations][0][:latLng][:lat]).to eq(38.892062)
    expect(coords[:results][0][:locations][0][:latLng][:lng]).to eq(-77.019912)
  end
end
