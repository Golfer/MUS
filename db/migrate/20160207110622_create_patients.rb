class CreatePatients < ActiveRecord::Migration
  def up
    create_table :patients do |t|
      t.references :building
      t.string :full_name, null: false
      t.string :gender
      t.string :date_birth, null: false
      t.string :appartment_number, null: false
      t.string :phone, default: '-'
      t.string :preferential_categories, default: '-'
      t.timestamps
    end
  end


  def down
    drop_table :patients
  end
end
