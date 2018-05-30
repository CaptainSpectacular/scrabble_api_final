require 'rails_helper'

context 'user can get game info' do
  context 'they send a get request' do
    scenario 'they send a GET to api/v1/games/1' do
      game = create(:game)
      expected = {
                  "game_id": game.id,
                  "scores": [
                     {
                      "user_id":game.player_1.id,
                      "score": game.player_1.score
                      },
                      {
                        "user_id": game.player_2.id,
                        "score": game.player_2.score
                       }
                      ]
                      }
      get "http://localhost:3000/api/v1/games/#{game.id}"
      anticipated = JSON.parse(response.body, symbolize_names: true)
     
      expect(anticipated).to eq(expected)
    end
  end
end
