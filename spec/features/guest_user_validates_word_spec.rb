require 'rails_helper'

feature 'guest user validates word' do
  describe 'searching for a word' do

  background do 
  end

    scenario 'the user sees whether a valid word' do 
      VCR.use_cassette('inflection_show') do
        visit root_path
        fill_in 'q', with: 'foxes'
        click_on 'Validate Word'

        expect(page).to have_content("'foxes' is a valid word and its root form is 'fox'")
      end
    end
    
    scenario 'the user sees an invalid word' do
      VCR.use_cassette('inflection_show_invalid') do
        visit root_path
        fill_in 'q', with: 'foxez'
        click_on 'Validate Word'

        expect(page).to have_content("'foxez' is not a valid word")
      end
    end
  end
end
