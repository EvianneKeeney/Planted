class CreatePlants < ActiveRecord::Migration[5.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :string
      t.string :cycle
      t.string :integer

      t.timestamps
    end
  end
end
