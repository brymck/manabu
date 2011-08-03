class CreateSections < ActiveRecord::Migration
  def self.up
    # Sections
    create_table :sections do |t|
      t.string :name, :null => false
    end

    # HABTM entry for levels and sections
    create_table :levels_sections, :id => false do |t|
      t.references :level, :null => false
      t.references :section, :null => false
    end

    # HABTM index
    add_index :levels_sections, [:level_id, :section_id], :unique => true

    Section.create_translation_table!({ :name => :string })
  end

  def self.down
    Section.drop_translation_table!
    remove_index :levels_sections, [:level_id, :section_id]
    drop_table :sections
    drop_table :levels_sections
  end
end
