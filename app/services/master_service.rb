class MasterService
  protected

  def conn 
    Faraday.new('https://od-api.oxforddictionaries.com/api/v1') 
  end 
  
  def get(url)
    conn.get do |req|
      req.headers['app_id']  = ENV['API_ID']
      req.headers['app_key'] = ENV['API_KEY']
      req.url   url
    end.body
  end

  def validate_request(request)
    case request.include?('<')
    when true then false 
    else JSON.parse(request, symbolize_names: true)
    end 
  end
end
