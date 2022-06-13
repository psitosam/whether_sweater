class UnsplashImageFacade

  def self.find_image(location)
    data = UnsplashImageService.image_data(location)[:results][0]
    BackgroundImage.new(data)
  end
end
