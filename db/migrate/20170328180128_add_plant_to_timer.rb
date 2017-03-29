class AddPlantToTimer < ActiveRecord::Migration[5.0]
  def change
    add_reference :timers, :plant, foreign_key: true
  end
end
