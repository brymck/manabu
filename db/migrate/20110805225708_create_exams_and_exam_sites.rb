class CreateExamsAndExamSites < ActiveRecord::Migration
  def self.up
    # Exams
    create_table :exams do |t|
      t.string :name
      t.string :abbreviation
    end

    # A level belongs to an exam
    add_column :levels, :exam_id, :integer

    # Locations
    create_table :locations do |t|
      t.string :name
    end

    # Make name unique
    add_index :locations, :name, :unique => true

    # Test sites
    create_table :sites do |t|
      t.string :name
      t.string :address
      t.float :lat
      t.float :lng
      t.references :location
    end

    # Make site name unique
    add_index :sites, :name, :unique => true

    # HABTM entry for exams and locations
    create_table :exams_locations, :id => false do |t|
      t.references :exam, :null => false
      t.references :location, :null => false
    end
    add_index :exams_locations, [:exam_id, :location_id], :unique => true

    # HABTM entry for levels and sites
    create_table :levels_sites, :id => false do |t|
      t.references :level, :null => false
      t.references :site, :null => false
    end
    add_index :levels_sites, [:level_id, :site_id], :unique => true
  end

  def self.down
    remove_column :levels, :exam_id
    remove_index :levels_sites, [:level_id, :site_id]
    remove_index :exams_locations, [:exam_id, :location_id]
    remove_index :locations, :name
    remove_index :sites, :name
    drop_table :levels_sites
    drop_table :exams_locations
    drop_table :sites
    drop_table :locations
    drop_table :exams
  end
end
