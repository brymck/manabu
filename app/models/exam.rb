class Exam < ActiveRecord::Base
  has_and_belongs_to_many :users,     :uniq => true
  has_and_belongs_to_many :locations, :uniq => true
  has_many :levels
  has_friendly_id :abbreviation, :use_slug => true
  translates :name
end


# == Schema Information
#
# Table name: exams
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  abbreviation :string(255)
#  cached_slug  :string(255)
#

