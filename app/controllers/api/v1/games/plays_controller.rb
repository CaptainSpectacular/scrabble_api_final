class Api::V1::Games::PlaysController < ActionController::API
  before_action :set_user, only: :create

  def create
    binding.pry
    Play.create(play_params)
  end


  private

  def play_params
    params.permit(:word, :game_id)
  end

  def set_user
    @user ||= User.find(params[:user])
  end
end
