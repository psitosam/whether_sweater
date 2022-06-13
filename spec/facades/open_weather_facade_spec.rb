require 'rails_helper'

RSpec.describe 'the open weather facade' do
  it 'returns a forecast object' do
    response = OpenWeatherFacade.find_forecast(37.541290, -77.434769)

    expect(response).to be_a Forecast
    expect(response.current).to be_a CurrentForecast
    expect(response.daily[0]).to be_a DailyForecast
    expect(response.hourly[0]).to be_a HourlyForecast
  end
end
