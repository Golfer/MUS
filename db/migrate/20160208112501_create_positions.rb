class CreatePositions < ActiveRecord::Migration
  def up
    create_table :positions do |t|
      t.string :type
      t.string :latitude
      t.string :longitude
      t.timestamps
    end
  end

  def down
    drop_table :positions
  end
end
