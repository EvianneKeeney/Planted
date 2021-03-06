class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @plants = current_user.plants
    @temperature = Temperature.new(current_user.latitude, current_user.longitude)
  end

  def show
    @user = current_user
    @plants = @user.plants
    @temperature = Temperature.new(current_user.latitude, current_user.longitude)
  end

  def new
    @plant = Plant.new
  end

  def edit
      @plant = Plant.find(params[:id])
  end

  def create
    @user = current_user
    @plant = Plant.new(new_plant_params)
    @plant.user = @user
    if @plant.save
      flash[:notice] = "Plant added!"
      redirect_to authenticated_root_path(@plant)
      PlantMailer.new_plant(@plant).deliver
    else
      render :new
    end
  end

  def update
    @plant = Plant.find(params[:id])
    @plant.date_last_watered = Time.new
    if @plant.save
      flash[:notice] = "Plant watered!"
    else
      flash[:notice] = "Error!"
    end
    redirect_to user_plants_path(current_user)
  end

  def destroy
    @plant.destroy
    respond_to do |format|
      format.html { redirect_to plants_url, notice: 'Plant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


    private

    def set_plant
      @plant = Plant.find(params[:id])
    end

    def plant_params
      params.permit(:name, :string, :cycle, :integer, :profile_photo, :remove_profile_photo, :date_last_watered, :user)
    end

    def new_plant_params
      params.require(:plant).permit(:name, :cycle, :profile_photo, :user)
    end
end
