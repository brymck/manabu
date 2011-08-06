class Location < ActiveRecord::Base
  has_and_belongs_to_many :exams, :uniq => true
  has_and_belongs_to_many :users, :uniq => true
  has_many :sites
  translates :name
end

# == Schema Information
#
# Table name: locations
#
#  id   :integer         not null, primary key
#  name :string(255)
#

