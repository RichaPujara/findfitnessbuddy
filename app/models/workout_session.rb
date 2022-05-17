class WorkoutSession < ApplicationRecord
    resourcify
    belongs_to :business_profile
    has_many :bookings, dependent: :destroy
end
