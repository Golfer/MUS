class Building < ActiveRecord::Base
  validates :full_address, presence: true
  has_many :patients, dependent: :delete_all
  belongs_to :position
  belongs_to :area
end
