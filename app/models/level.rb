class Level < ActiveRecord::Base
  belongs_to :exam
  has_and_belongs_to_many :questions, :uniq => true
  has_and_belongs_to_many :sections,  :uniq => true
  has_and_belongs_to_many :sites,     :uniq => true
  has_friendly_id :abbreviation,      :use_slug => true
end




# == Schema Information
#
# Table name: levels
#
#  id           :integer         not null, primary key
#  exam_id      :integer
#  name         :string(255)
#  abbreviation :string(255)
#  cached_slug  :string(255)
#

