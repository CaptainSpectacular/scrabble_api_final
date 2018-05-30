class WordValidator
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def valid?
    @valid ||= service.get("inflections/en/#{@word}")
  end

  private

  def service
    ScrabbleService.new(@word)
  end
end
