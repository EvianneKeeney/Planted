class Api::V1::TimersController < ApplicationController
  def index
    render json: Timer.all
  end

  def show
    render json: Timer.all
  end
end
