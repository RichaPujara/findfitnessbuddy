class WorkoutSession < ApplicationRecord
    belongs_to :buddy
    has_many :bookings, dependent: :destroy

    validates :name, presence: true
    validates :date, presence: true
    validates :duration, presence: true
    validates :workout_type, presence: true
    validates :workout_category, presence: true
    validates :fees, presence: true
    validates :difficulty_level, presence: true
end
