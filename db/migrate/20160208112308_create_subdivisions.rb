class CreateSubdivisions < ActiveRecord::Migration
  def change
    create_table :subdivisions do |t|
      t.string :name
      t.string :number, null: false
      t.string :description
      t.timestamps
    end
  end
end
