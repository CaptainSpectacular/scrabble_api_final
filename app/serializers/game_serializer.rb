class GameSerializer < ActiveModel::Serializer
  attributes :id, :scores 
  belongs_to :player_1, class_name: 'User', foreign_key: :player_1_id
  belongs_to :player_2, class_name: 'User', foreign_key: :player_2_id

  def scores
    [object.player_1.id, object.player_2]
  end
end
