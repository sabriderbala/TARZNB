class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :caban

  validates :status, inclusion: { in: %w(pending accepted declined) }
  validates :end_date, comparison: {greater_than: :start_date}

end
