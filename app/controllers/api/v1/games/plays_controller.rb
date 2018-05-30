class Api::V1::Games::PlaysController < ActionController::API
  before_action :set_user, only: :create

  def create
    @user.plays.create(play_params)
    @user.score += @user.plays.last.score
    @user.save
    render json: { 'status' => 'you made your move' }.to_json, status: 201
  end


  private

  def play_params
    params.permit(:word, :game_id)
  end

  def set_user
    @user ||= User.find(params[:user])
  end
end