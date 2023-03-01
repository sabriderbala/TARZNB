class Caban < ApplicationRecord
  include CabanConcern

  belongs_to :user
  has_many :bookings
  has_many_attached :photos, dependent: :purge
end
