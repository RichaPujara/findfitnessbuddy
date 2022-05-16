json.extract! workout_session, :id, :start_time, :duration, :workout_type, :date, :workout_category, :description, :fees, :difficulty_level, :created_at, :updated_at
json.url workout_session_url(workout_session, format: :json)
