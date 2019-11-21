class Studio < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
  validates :category, presence: true
  # validates :price_per_hour, presence: true, numericality: { only_integer: true }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include AlgoliaSearch

  algoliasearch do
    attributes :name, :category, :city
  end

  # Modelname.reindex each time change the model
end
