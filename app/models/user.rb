class User < ActiveRecord::Base
  attr_accessible :name, :email, :cached_slug

  has_and_belongs_to_many :exams,     :uniq => true
  has_and_belongs_to_many :locations, :uniq => true
  has_many                :authentications
  has_friendly_id         :name,      :use_slug => true

  validates               :name,  :presence => true
  validates               :email, :presence => true
  validates_uniqueness_of :email

  def test
    name.to_url.gsub /[-]+/, '.'    
  end

  private

  def normalize_friendly_id(text)
    text.to_url.gsub /[-]+/, '.'
  end
end



# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)     not null
#  email      :string(255)     not null
#  created_at :datetime
#  updated_at :datetime
#  admin      :boolean         default(FALSE)
#

