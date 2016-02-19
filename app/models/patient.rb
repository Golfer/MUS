class Patient < ActiveRecord::Base
  # acts_as_xlsx
  validates :full_name, :date_birth, :appartment_number, :building, presence: true
  belongs_to :building
  scope :order_by_appartment_number, -> { order(appartment_number: :asc) }
  scope :not_visible_true, -> { where(not_visible: false) }
end
