class ScrabbleService
  
  def initialize(word)
    @url = "inflections/en/#{word}" 
  end

  def get(url)
    conn.get do |req|
      req.headers['app_id']  = ENV['API_ID'] 
      req.headers['app_key'] = ENV['API_KEY'] 
      req.url   url
    end.body
  end

  private

  def conn
    Faraday.new('https://od-api.oxforddictionaries.com/api/v1')
  end

end
