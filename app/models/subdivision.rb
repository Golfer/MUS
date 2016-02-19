class Subdivision < ActiveRecord::Base
  validates :number, presence: true
end
