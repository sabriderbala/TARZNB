class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :caban

  validates :status, inclusion: { in: %w(pending accepted declined) }
end
