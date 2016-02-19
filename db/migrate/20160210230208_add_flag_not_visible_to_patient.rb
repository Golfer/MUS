class AddFlagNotVisibleToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :not_visible, :boolean, default: false
  end
end
