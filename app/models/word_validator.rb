class WordValidator
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def valid?
    @valid ||= service.get_inflection
    @valid.is_a?(Hash)
  end

  def root
    @valid[:results][0][:lexicalEntries][0][:inflectionOf][0][:text]
  end

  private

  def service
    ScrabbleService.new(@word)
  end
end
