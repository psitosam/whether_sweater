class UnsplashImageService

  def self.image_data(query)
    response = conn.get("/search/photos") do |r|
      r.params['query'] = query
      r.params['page'] = '1'
      r.params['per_page'] = '1'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

    def self.conn
      Faraday.new("https://api.unsplash.com") do |r|
        r.params['client_id'] = ENV['unsplash_key']
      end
    end
end
