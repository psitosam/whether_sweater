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

  def self.incomplete_fields
    { data: { message: 'All fields must be filled in'} }
  end

  def self.email_in_use
    { data: { message: 'Email already in use'} }
  end

  def self.password_mismatch
    { data: { message: 'Passwords must match'} }
  end

  def self.bad_credentials
    { data: { message: 'Invalid credentials'} }
  end

  def self.bad_request
    { data: { message: 'bad request'} }
  end
end
