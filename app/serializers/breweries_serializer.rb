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
      "breweries": [
        {
          "id": 10129,
          "name": "Denver Beer Co Olde Town Arvada",
          "brewery_type": "micro"
        },
        {
          "id": 12906,
          "name": "New Image Brewing Co",
          "brewery_type": "brewpub"
        },
        { ... same format for breweries 3, 4 and 5 ... }
      ]
    }
  }
}
  end
end
