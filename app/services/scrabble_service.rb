class ScrabbleService < MasterService
  
  def initialize(word)
    @word = word
  end

  def get_inflection
    request = get("inflections/en/#{@word}")
    validate_request(request)
  end
end
