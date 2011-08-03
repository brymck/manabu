class Level < ActiveRecord::Base
  has_and_belongs_to_many :questions, :uniq => true
  has_and_belongs_to_many :sections, :uniq => true

  def name
    "N#{id}"
  end
end

# == Schema Information
#
# Table name: levels
#
#  id :integer         primary key
#

