class Question < ActiveRecord::Base
  belongs_to :section
  has_and_belongs_to_many :levels, :uniq => true
  has_many :answers
  validates :content, :presence => true

  def A
    answers[0]
  end

  def B
    answers[1]
  end

  def C
    answers[2]
  end

  def D
    answers[3]
  end
end

# == Schema Information
#
# Table name: questions
#
#  id         :integer         primary key
#  content    :text
#  created_at :timestamp
#  updated_at :timestamp
#

