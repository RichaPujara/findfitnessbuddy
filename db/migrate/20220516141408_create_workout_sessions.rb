class CreateWorkoutSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :workout_sessions do |t|
      t.datetime :start_time
      t.integer :duration
      t.string :workout_type
      t.date :date
      t.string :workout_category
      t.text :description
      t.float :fees
      t.string :difficulty_level

      t.timestamps
    end
  end
end
