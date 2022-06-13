require 'rails_helper'

RSpec.describe 'the map quest facade' do
  it 'returns a map object' do
    response = MapQuestFacade.find_coordinates("Washington,DC")

    expect(response).to be_a Location
    expect(response.latitude).to be_a Float
    expect(response.longitude).to be_a Float
  end
end
