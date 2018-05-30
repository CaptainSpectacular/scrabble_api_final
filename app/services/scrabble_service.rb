class ScrabbleService
  
  def initialize(word)
    @word = word
  end

  def get_root
    binding.pry
    JSON.parse(get("entries/en/#{@word}"), symbolize_names: true)
  end

  def get_inflection
    request = get("inflections/en/#{@word}")

    case request.include?('<')
    when true then false 
    else JSON.parse(request, symbolize_names: true)
    end
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
