class Position < ActiveRecord::Base
  belongs_to :building
  validates :latitude, :longitude, presence: true
end
