# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

5.times do
  Level.create
end

Section.create :name => "Grammar"
Section.create :name => "Vocabulary"
Section.create :name => "Kanji"
Section.create :name => "Reading Comprehension"
