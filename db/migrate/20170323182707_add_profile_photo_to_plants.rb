class AddProfilePhotoToPlants < ActiveRecord::Migration[5.0]
  def change
    add_column :plants, :profile_photo, :string
  end
end
