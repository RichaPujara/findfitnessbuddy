class Booking < ApplicationRecord
  resourcify
  belongs_to :user
  belongs_to :workout_session
end
