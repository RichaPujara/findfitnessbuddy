class CreateWorkoutSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :workout_sessions do |t|
      t.string :name
      t.datetime :date
      t.integer :duration
      t.string :workout_type
      t.string :workout_category
      t.text :description
      t.float :fees
      t.string :difficulty_level

      t.timestamps

      t.references :buddy, null: false, foreign_key: true
    end
  end
end
