class AddDefaultToBookingPaidConfirmed < ActiveRecord::Migration[5.2]
  def change
    change_column_default :bookings, :paid, false
    change_column_default :bookings, :confirmed, false
  end
end
