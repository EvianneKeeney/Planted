class CreatePlant < ActiveRecord::Migration[5.0]
  def change
    create_table :plants do |t|
      t.string :name, null: false
      t.integer :cycle, null:false

      t.timestamps
    end
  end
end
