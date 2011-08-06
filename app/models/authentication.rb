class Authentication < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :uid, :scope => :provider
end

# == Schema Information
#
# Table name: authentications
#
#  id         :integer         not null, primary key
#  provider   :string(255)
#  uid        :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

