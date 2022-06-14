class BreweriesSerializer

  def self.brewery_response(forecast, breweries, location, quantity)
    {
  "data": {
    "id": "null",
    "type": "breweries",
    "attributes": {
      "destination": "#{location}",
      "forecast": {
        "summary": forecast.current.conditions,
        "temperature": forecast.current.temperature
      },
      "breweries": breweries.shift(quantity).map do |brewery|
        {
          "id": brewery[:id],
          "name": brewery[:name],
          "brewery_type": brewery[:brewery_type]
        }
      end
    }
  }
}
  end
end
