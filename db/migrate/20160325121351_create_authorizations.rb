class CreateAuthorizations < ActiveRecord::Migration
  def self.up
    create_table :authorizations do |t|
      t.integer :user_id, null: false
      t.string :provider, null: false
      t.string :username
      t.string :uid, null: false
      t.string :token, null: false
      t.string :secret

      t.timestamps null: false
    end
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
