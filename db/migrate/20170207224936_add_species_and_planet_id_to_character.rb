class AddSpeciesAndPlanetIdToCharacter < ActiveRecord::Migration[5.0]
  def change
    add_column :characters, :species_id, :integer
    add_column :characters, :homeplanet_id, :integer
  end
end
