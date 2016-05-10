class Area < ActiveRecord::Base
  has_many :buildings, dependent: :delete_all

  validates :name, presence: true

end
