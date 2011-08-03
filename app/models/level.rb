class Level < ActiveRecord::Base
  has_and_belongs_to_many :questions, :uniq => true

  def name
    "N#{id}"
  end
end