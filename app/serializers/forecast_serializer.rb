class ForecastSerializer

  def self.new_forecast(forecast)
    {
      "data":
      {
        "id": nil,
        "type": "forecast",
        "attributes":
        {
          "current_weather":
          {
            "datetime": Time.at(forecast.current.datetime.to_i),
            "sunrise": Time.at(forecast.current.sunrise.to_i),
            "sunset": Time.at(forecast.current.sunset.to_i),
            "temperature": forecast.current.temperature,
            "feels_like": forecast.current.feels_like,
            "humidity": forecast.current.humidity,
            "uvi": forecast.current.uvi,
            "visibility": forecast.current.visibility,
            "conditions": forecast.current.conditions,
            "icon": forecast.current.icon
          },
          "daily_weather": forecast.daily.shift(5).map do |day|
              {
                "date": Date.jd(day.date.to_i),
                "sunrise": Time.at(day.sunrise.to_i),
                "sunset": Time.at(day.sunset.to_i),
                "max_temp": day.max_temp,
                "min_temp": day.min_temp,
                "conditions": day.conditions,
                "icon": day.icon
              }
          end,
          "hourly_weather": forecast.hourly.shift(8).map do |hour|
              {
                "time": Time.at(hour.time.to_i),
                "temperature": hour.temperature,
                "conditions": hour.conditions,
                "icon": hour.icon
              }
          end
        }
      }
    }
  end
end
