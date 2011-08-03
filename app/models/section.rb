class Section < ActiveRecord::Base
  has_and_belongs_to_many :levels, :uniq => true
  has_many :questions
  translates :name
end
