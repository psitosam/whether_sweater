class Forecast
  attr_reader :current, :daily, :hourly

  def initialize(data)
    @current = CurrentForecast.new(data)
    @daily = five_day_forecast(data) #this is an array of hashes
    @hourly = eight_hour_forecast(data) #this is also an array of hashes 
  end

  def five_day_forecast(data)
    data[:daily][0..4].map do |day|
      DailyForecast.new(day)
    end
  end

  def eight_hour_forecast(data)
    data[:hourly][0..7].map do |hour|
      HourlyForecast.new(hour)
    end
  end
end
