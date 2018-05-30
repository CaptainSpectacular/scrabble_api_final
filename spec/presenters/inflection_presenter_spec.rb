require 'rails_helper'

describe InflectionPresenter do
  let(:validator) { WordValidator.new('genius') }

  describe 'creation' do
    it 'is created with a validator object' do
      presenter = described_class.new(validator)

      expect(presenter).to be_a(InflectionPresenter)
    end
  end
  
  describe 'instance methods' do
    let(:presenter) { described_class.new(validator) }
    describe '#validation' do
      it 'returns a valid message' do
        VCR.use_cassette('inflection_valid') do
          VCR.use_cassette('word_root') do
            expect(presenter.validation).to include("'genius' is a valid word")
          end
        end
      end

      it 'can return an invalid message' do
        VCR.use_cassette('inflection_invalid') do
          bad = WordValidator.new('farquad')
          presenter = InflectionPresenter.new(bad)
        
          expect(presenter.validation).to eq("'farquad' is not a valid word.")
        end
      end
    end
  end
end
