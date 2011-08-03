class CreateBasicOutline < ActiveRecord::Migration
  def self.up
    # Levels
    create_table :levels do |t|
    end

    # Questions
    create_table :questions do |t|
      t.text :content

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
  end
end
