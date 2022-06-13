class BackgroundImage
  attr_reader :website_source,
              :image_id,
              :description,
              :url,
              :photographer,
              :photographer_profile

  def initialize(data)
    @website_source = 'https://unsplash.com'
    @image_id = data[:id]
    @description = data[:description]
    @url = data[:urls][:full]
    @photographer = data[:user][:name]
    @photographer_profile = data[:user][:links][:self]
  end
end
