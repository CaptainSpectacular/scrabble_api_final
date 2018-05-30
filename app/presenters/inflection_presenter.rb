class InflectionPresenter
  def initialize(validator)
    @validator = validator
  end

  def validation
    case @validator.valid?
    when true then valid_message
    else invalid_message
    end
  end
  
  def valid_message
    "#{@validator.word} is a valid word and it's root form is #{@validator.root}"
  end

  def invalid_message
    "#{@validator.word} is not a valid word."
  end
end
