class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.string :code
      t.text :metar

      t.timestamps
    end
  end
end
