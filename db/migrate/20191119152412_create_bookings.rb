class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.boolean :paid
      t.boolean :confirmed
      t.references :user, foreign_key: true
      t.references :studio, foreign_key: true

      t.timestamps
    end
  end
end
