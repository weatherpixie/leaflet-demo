class CreateStations < ActiveRecord::Migration[7.0]
  def change
    create_table :stations do |t|
      t.string :code
      t.integer :country_id
      t.string :name
      t.string :state
      t.decimal :longitude
      t.decimal :latitude

      t.timestamps
    end
  end
end
