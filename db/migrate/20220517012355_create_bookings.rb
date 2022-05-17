class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :workout_session, null: false, foreign_key: true
      t.boolean :booking_approved, default: true

      t.timestamps
    end
  end
end
