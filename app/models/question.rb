class Question < ActiveRecord::Base
  has_and_belongs_to_many :levels, :uniq => true
  has_many :answers

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
