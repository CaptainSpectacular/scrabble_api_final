class Api::V1::GamesController < ActionController::API 
  def show
    binding.pry
    render json: Game.all
  end
end
