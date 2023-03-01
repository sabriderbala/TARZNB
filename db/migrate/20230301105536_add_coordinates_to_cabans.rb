class AddCoordinatesToCabans < ActiveRecord::Migration[7.0]
  def change
    add_column :cabans, :latitude, :float
    add_column :cabans, :longitude, :float
  end
end
