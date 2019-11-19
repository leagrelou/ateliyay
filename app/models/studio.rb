class Studio < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
  validates :category, presence: true
  # validates :price_per_hour, presence: true, numericality: { only_integer: true }
end
