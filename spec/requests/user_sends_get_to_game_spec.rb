require 'rails_helper'

context 'user can get game info' do
  context 'they send a get request' do
    scenario 'they send a GET to api/v1/games/:id' do
      expected = {
                  "game_id":1,
                  "scores": [
                     {
                      "user_id":1,
                      "score":15
                      },
                      {
                        "user_id":2,
                        "score":16
                       }
                      ]
                      }
      get "api/v1/games/#{game.id}"
      anticipated = JSON.parse(response.body)
     
      expect(anticipated).to eq(expected)
    end
  end
end
