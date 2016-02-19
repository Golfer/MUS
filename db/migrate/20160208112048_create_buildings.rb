class CreateBuildings < ActiveRecord::Migration
  def up
    create_table :buildings do |t|
      t.references :position
      t.references :area
      t.string :full_address, null: false
      t.string :description
      t.timestamps
    end
  end

  def down
    drop_table :buildings
  end
end
