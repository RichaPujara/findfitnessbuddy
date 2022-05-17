class BusinessProfile < ApplicationRecord
  belongs_to :user
  has_many :workout_sessions
end
