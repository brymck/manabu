class Answer < ActiveRecord::Base
  belongs_to :question
  validates :content, :presence => true
end


# == Schema Information
#
# Table name: answers
#
#  id          :integer         not null, primary key
#  content     :text
#  correct     :boolean
#  question_id :integer
#

