require 'rails_helper'

RSpec.describe BreweryFacade do
  it 'find_breweries' do
    location = 'richmond'
    breweries = BreweryFacade.find_breweries(location)
    VCR.use_cassette('find_breweries') do

    expect(breweries).to be_a Array
    breweries.each do |brewery|
      expect(brewery).to have_key(:id)
      expect(brewery).to have_key(:name)
      expect(brewery).to have_key(:brewery_type)
    end
  end
  end
end
