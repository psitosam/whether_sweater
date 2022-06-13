require 'rails_helper'

RSpec.describe 'the unsplash image facade' do
  it 'returns a background image object' do
    response = UnsplashImageFacade.find_image('Washington,DC')
    expect(response).to be_a BackgroundImage
  end
end
