class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :studio

  def studio_owner

  end
end
