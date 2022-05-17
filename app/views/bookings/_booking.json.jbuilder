json.extract! booking, :id, :user_id, :workout_session_id, :booking_approved, :created_at, :updated_at
json.url booking_url(booking, format: :json)
