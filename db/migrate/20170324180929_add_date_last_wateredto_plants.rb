class AddDateLastWateredtoPlants < ActiveRecord::Migration[5.0]
  def up
    add_column :plants, :date_last_watered, :datetime
  end

  def down
    remove_column :plants, :date_last_watered, :datetime
  end
end
