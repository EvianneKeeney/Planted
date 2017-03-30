class PlantMailer < ApplicationMailer
  def new_plant(plant)
    @plant = plant

    mail(
    to: plant.user.email,
    subject: "Planted #{plant.name}"
    )
  end

  def water_plant(plant)
    @plant = plant

    mail(
    to: plant.user.email,
    subject: "Watered #{plant.name}"
    )
  end
end
