require 'rails_helper'

feature 'guest user validates word' do
  describe 'searching for a word' do

  background do 
    VCR.use_cassette('inflection_show') do
      visit root_path
      fill_in 'q', with: 'foxes'
      click_on 'Validate Word'
    end
  end

    scenario 'the user sees whether it is a word or not' do 
      expect(page).to have_content("'foxes' is a valid word and its root form is 'fox'")
    end
  end
end
