class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date

      t.integer :client_id
      t.integer :listing_view_id

      t.timestamps
    end
  end
end
