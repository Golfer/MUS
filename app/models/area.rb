class Area < ActiveRecord::Base
  validates :name, presence: true
  has_many :buildings, dependent: :delete_all
end
