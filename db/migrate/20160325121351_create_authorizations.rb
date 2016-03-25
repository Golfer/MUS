class CreateAuthorizations < ActiveRecord::Migration
  def self.up
    create_table :authorizations do |t|
      t.integer :user_id
      t.string :provider
      t.string :username
      t.string :uid
      t.string :token
      t.string :secret

      t.timestamps null: false
    end
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
