class Api::V1::PlantsController < ApplicationController
  def index
    render json: Plant.all
  end

  def show
    render json: Plant.all
  end 
end
