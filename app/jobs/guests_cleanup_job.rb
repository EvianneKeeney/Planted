class GuestsCleanupJob < ApplicationJob
  queue_as :urgent

  def perform(*guests)
    PlantMailer.new_plant(@plant).deliver
  end
end
