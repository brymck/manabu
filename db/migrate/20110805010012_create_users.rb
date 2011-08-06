class CreateUsers < ActiveRecord::Migration
  def self.up
    # Create user
    create_table :users do |t|
      t.string  :name,        :null => false 
      t.string  :email,       :null => false
      t.string  :cached_slug
      t.boolean :admin,       :default => false

      t.timestamps
    end

    # Make email and slug unique
    add_index :users,  :email,      :unique => true
    add_index :users, :cached_slug, :unique => true

    # Create user authentications
    create_table :authentications do |t|
      t.string :provider
      t.string :uid
      t.references :user

      t.timestamps
    end

    # Make combination of provider and UID unique
    add_index :authentications, [:provider, :uid], :unique => true
  end

  def self.down
    drop_table :authentications
    drop_table :users
  end
end
