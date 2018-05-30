class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores 

  def scores
    [{user_id: object.player_1.id, score: object.player_1.score},
     {user_id: object.player_2.id, score: object.player_2.score}]
  end

  def game_id
    object.id
  end
end
