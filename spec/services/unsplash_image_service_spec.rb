require 'rails_helper'

RSpec.describe 'the unsplash image service' do
  it 'returns a faraday connection' do
    conn = UnsplashImageService.conn
    expect(conn).to be_a(Faraday::Connection)
  end

  it 'returns image data for a location', :vcr do
    response = UnsplashImageService.image_data('Washington,DC')

    expect(response).to have_key(:results)
    expect(response[:results]).to be_a Array
    expect(response[:results][0]).to have_key(:urls)
    expect(response[:results][0]).to have_key(:user)
  end
end
