class Caban < ApplicationRecord
  include CabanConcern
  include PgSearch::Model
  pg_search_scope :global_search,
  against: [ :name, :description, :address ],
  using: {
    tsearch: { prefix: true }
  }

  belongs_to :user
  has_many :bookings
  has_many_attached :photos, dependent: :purge
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?


end
