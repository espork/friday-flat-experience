class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :country
      t.string :city
      t.string :adress
      t.string :zip_code
      t.float  :latitude
      t.float  :longitude
      t.timestamps
    end
  end
end
