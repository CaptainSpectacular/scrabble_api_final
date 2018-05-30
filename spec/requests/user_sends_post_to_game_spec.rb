require 'rails_helper'

describe 'a play a word' do
  context 'they send a post request' do
    scenario 'the score changes' do
      game = create(:game)
      p1 = game.player_1
      old_score = p1.score

      post "http://localhost:3000/api/v1/games/#{game.id}/plays?user=#{p1.id}&word=at"

      expect(response.status).to eq(201)

      get "http://localhost:3000/api/v1/games/#{game.id}"

      new_score = JSON.parse(response.body, symbolize_names: true)[:scores][0][:score] 

      expect(new_score - old_score).to eq(2)
    end
  end
end
