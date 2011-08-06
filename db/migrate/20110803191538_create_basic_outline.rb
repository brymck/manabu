class CreateBasicOutline < ActiveRecord::Migration
  def self.up
    # Levels
    create_table :levels do |t|
      t.string :name
    end

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
    
    # Questions
    create_table :questions do |t|
      t.text :content
      t.references :section, :null => false

      t.timestamps
    end

    # Answers
    create_table :answers do |t|
      t.text :content
      t.boolean :correct
      t.references :question
    end

    # HABTM entry for levels and questions
    create_table :levels_questions, :id => false do |t|
      t.references :level, :null => false
      t.references :question, :null => false
    end

    # HABTM index
    add_index :levels_questions, [:level_id, :question_id], :unique => true
  end

  def self.down
    remove_index :levels_questions, [:level_id, :question_id]
    drop_table :levels
    drop_table :questions
    drop_table :answers
    drop_table :levels_questions
    Section.drop_translation_table!
    remove_index :levels_sections, [:level_id, :section_id]
    drop_table :sections
    drop_table :levels_sections
  end
end
