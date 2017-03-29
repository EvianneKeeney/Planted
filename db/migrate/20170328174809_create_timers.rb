class CreateTimers < ActiveRecord::Migration[5.0]
  def change
    create_table :timers do |t|
      t.datetime :date_watered

      t.timestamps
    end
  end
end
