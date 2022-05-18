class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.boolean :booking_status, default: true
      t.references :user, null: false, foreign_key: true
      t.references :workout_session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
