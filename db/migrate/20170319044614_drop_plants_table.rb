class DropPlantsTable < ActiveRecord::Migration[5.0]
  def up
   drop_table :plants
 end

 def down
   raise ActiveRecord::IrreversibleMigration
 end
end
