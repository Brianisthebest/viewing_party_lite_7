class MovieService
  def search(key_word)
    get_url("/3/search/movie?query=#{key_word}")
  end

  def top_rated
    get_url("/3/movie/top_rated")
  end

  def find_movie(movie_id)
    get_url("/3/movie/#{movie_id}")
  end

  def credits(movie_id)
    get_url("/3/movie/#{movie_id}/credits")
  end
  
  def reviews(movie_id)
    get_url("/3/movie/#{movie_id}/reviews")
  end

  private

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV['moviedb_api_key']
      faraday.params["language"] = "en-US"
    end
  end
end
