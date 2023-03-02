class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :caban

  validates :status, inclusion: { in: %w(pending accepted declined) }
  validates :end_date, comparison: {greater_than: :start_date}


  include PgSearch::Model
  pg_search_scope :search_by_status,
    against: [ :status ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
