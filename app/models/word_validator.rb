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
    @root ||= service.get_root
    binding.pry
  end

  private

  def service
    ScrabbleService.new(@word)
  end
end
