class WordValidator
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def valid?
    @valid ||= service.get_inflection(@word)
    @valid.is_a?(Hash)
  end

  private

  def service
    ScrabbleService.new(@word)
  end
end
