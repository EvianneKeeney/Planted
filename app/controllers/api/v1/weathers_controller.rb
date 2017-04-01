class Api::V1::WeathersController < ApplicationController
  def index
      render json: weather
  end
end
