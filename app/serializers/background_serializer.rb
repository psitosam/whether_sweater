class BackgroundSerializer

  def self.format_background(image)
    {
      "data": {
        "type": "image",
        "id": nil,
        "attributes": {
          "image": {
            "image_id": image.image_id,
            "description": image.description,
            "url": image.url
          },
          "credit": {
            "website_source": image.website_source,
            "photographer": image.photographer,
            "photographer_profile": image.photographer_profile
          }
        }
      }
    }
  end
end 
