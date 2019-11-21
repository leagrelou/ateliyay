class AddStartTimeEndTimeToBookings < ActiveRecord::Migration[5.2]
  def change
    # remove old date-time columns
    remove_column :bookings, :start_datetime
    remove_column :bookings, :end_datetime, :date

    # replace with date columns
    add_column :bookings, :start_date, :date
    add_column :bookings, :end_date, :date

    # add time columns
    add_column :bookings, :start_time, :time
    add_column :bookings, :end_time, :time
  end
end
