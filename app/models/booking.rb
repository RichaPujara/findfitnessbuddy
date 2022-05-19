class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :workout_session
  resourcify
end
