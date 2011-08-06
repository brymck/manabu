class AddExamsToUsers < ActiveRecord::Migration
  def self.up
    # HABTM entry for exams and locations
    create_table :exams_users, :id => false do |t|
      t.references :exam, :null => false
      t.references :user, :null => false
    end
    add_index :exams_users, [:exam_id, :user_id], :unique => true

    # HABTM entry for users and locations
    create_table :locations_users, :id => false do |t|
      t.references :location, :null => false
      t.references :user,     :null => false
    end
    add_index :locations_users, [:location_id, :user_id], :unique => true
  end

  def self.down
    remove_index :exams_users,     [:exam_id,     :user_id]
    remove_index :locations_users, [:location_id, :user_id]
    drop_table :exams_users
    drop_table :locations_users
  end
end
