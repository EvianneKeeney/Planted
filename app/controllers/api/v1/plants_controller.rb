class Api::V1::PlantsController < ApplicationController
  def index
    render json: Plant.all
  end

  def show
    render json: Plant.find(params[:id])
  end

  def update
    @plant = Plant.find(params[:id])
    @plant.date_last_watered = Time.new
    @plant.save
    render status: 201, json: {}
  end

end
