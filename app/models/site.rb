class Site < ActiveRecord::Base
  belongs_to :location
  has_and_belongs_to_many :levels, :uniq => true
  translates :name
end

# == Schema Information
#
# Table name: sites
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  address     :string(255)
#  lat         :float
#  lng         :float
#  location_id :integer
#

