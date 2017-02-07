class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :gender
      t.string :species
      t.string :homeplanet
      t.string :profession
      t.string :vehicle
      t.string :starship
      t.integer :user_id
      t.text :backstory

      t.timestamps
    end
  end
end
