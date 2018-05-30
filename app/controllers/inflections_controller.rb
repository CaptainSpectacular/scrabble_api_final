class InflectionsController < ApplicationController
  def show
    presenter = InflectionPresenter.new(WordValidator.new(params[:q]))
  end
end
