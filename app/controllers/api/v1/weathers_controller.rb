class Api::V1::WeatherController < ApplicationController
  def index
    render json: Weather.all
  end
end
