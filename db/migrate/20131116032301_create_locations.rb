class CreateLocations < ActiveRecord::Migration
  def up
    create_table :locations do |t|
      t.string :title
      t.string :release_year
      t.string :location
      t.text :fun_facts
      t.string :production_company
      t.string :distributor
      t.string :director
      t.string :writer
      t.string :actor_1
      t.string :actor_2
      t.string :actor_3
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end

  def down
    drop_table :locations
  end
end
