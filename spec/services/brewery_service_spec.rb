require 'rails_helper'

RSpec.describe 'the brewery service' do
  it 'returns a Faraday connection' do
    conn = BreweryService.conn
    expect(conn).to be_a(Faraday::Connection)
  end
end
