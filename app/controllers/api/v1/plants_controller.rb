class Api::V1::PlantsController < ApplicationController

  def index
    render json: Plant.all.sort
  end

  def show
    render json: Plant.find(params[:id])
  end

  def update
    @plant = Plant.find(params[:id])
    @plant.date_last_watered = Time.new
    @plant.save
    date_last_watered_to_i = @plant.date_last_watered.to_i
    cycle_in_ms = @plant.cycle.to_f*86400
    to_water = date_last_watered_to_i + cycle_in_ms
    date_to_water = Time.at(to_water)
    if Time.now.to_i > Time.now.to_i + 30
      PlantMailer.water_plant(@plant).deliver
    end
    render status: 201, json: {}
  end

end
