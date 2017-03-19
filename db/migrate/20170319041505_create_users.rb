class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :string
      t.string :last_name
      t.string :username
      t.string :string
      t.string :email
      t.string :string

      t.timestamps
    end
  end
end
