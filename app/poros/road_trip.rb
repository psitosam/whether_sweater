class RoadTrip
  attr_reader :forecast,
              :destination_forecast,
              :start_city,
              :start_state,
              :end_city,
              :end_state,
              :travel_seconds,
              :travel_hours,
              :travel_time,
              :arrival_time,
              :arrival_date_time

  def initialize(data, forecast)
    @data           = data
    @forecast       = forecast
    @start_city     = data[:route][:locations][0][:adminArea5]
    @start_state    = data[:route][:locations][0][:adminArea3]
    @end_city       = data[:route][:locations][1][:adminArea5]
    @end_state      = data[:route][:locations][1][:adminArea3]
    @travel_seconds = data[:route][:legs][0][:time]
    @travel_hours   = @travel_seconds / 3600
    @travel_time    = travel_time
    @arrival_time   = arrival_time
    @arrival_date_time   = arrival_date_time
    @destination_forecast = destination_forecast
    @destination_temp = destination_temp
  end

  def travel_time
    ActiveSupport::Duration.build(@travel_seconds).inspect
    #returns "1 day, 43 minutes, and 12 seconds"
  end

  def arrival_time
    time = (Time.now + @travel_seconds).strftime("%I:%M:%S %p")
    #returns "11:36:17 PM"
  end

  def arrival_date_time
    time = (Time.now + @travel_seconds).strftime("at %b %e, %l:%M %p")
    #returns "at Jun 15, 11:04 PM"
  end

  def destination_forecast
    if @travel_hours < 48
      destination_forecast = forecast[:hourly][@travel_hours -1][:weather][0][:description]
    elsif @travel_hours > 48
      destination_forecast = forecast[:daily][(@travel_hours -1) / 24][:weather][0][:description]
    end
    # in the forecast hash, forecast.daily[1] is the weather expected the next day. Since we only have information from the next 8 hours, we are either returning the current day's forecast if the trip is between 1 to 8 hours and the next day's forecast if the trip is 24 hours or longer.
  end

  def destination_temp
    if @travel_hours < 48
      destination_temp = forecast[:hourly][@travel_hours -1][:temp]
    elsif @travel_hours > 48
      destination_temp = forecast[:daily][(@travel_hours -1) / 24][:temp]
    end
  end
end
