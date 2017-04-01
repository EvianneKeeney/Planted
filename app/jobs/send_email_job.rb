class SendEmailJob < ApplicationJob
  queue_as :default

  def perform()
    @plant = Plant.find(params[:id])
    PlantMailer.new_plant(@plant).deliver
  end
end
