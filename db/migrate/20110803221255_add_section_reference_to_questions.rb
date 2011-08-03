class AddSectionReferenceToQuestions < ActiveRecord::Migration
  def self.up
    # Add questions table
    add_column :questions, :section_id, :integer

    # Set unresolved columns to first available ID
    first_id = Section.first.id
    Question.reset_column_information
    Question.find(:all).each do |question|
      question.update_attribute :section_id, first_id
    end
    
    # Make section ID not null
    change_column :questions, :section_id, :integer, :null => false
  end

  def self.down
    remove_column :questions, :section_id
  end
end
