class AddLocationTranslations < ActiveRecord::Migration
  def self.up
    Exam.create_translation_table!     :name => :string
    Location.create_translation_table! :name => :string
    Site.create_translation_table!     :name => :string
  end

  def self.down
    Exam.drop_translation_table!
    Location.drop_translation_table!
    Site.drop_translation_table!
  end
end
