class SadpathSerializer

  def self.bad_api_key
    { data: { message: 'Invalid api key'} }
  end

  def self.bad_road_trip(to, from)
    {
      "data":
      {
        "id": "null",
        "type": "roadtrip",
        "attributes":
        {
          "start_city": from,
          "end_city": to,
          "travel_time": "impossible route",
          "travel_distance": "impossible route",
          "weather_at_eta":
          {
            "temperature": "",
            "conditions": ""
          }
        }
      }
    }
  end
end
