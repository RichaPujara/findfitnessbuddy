class WorkoutSession < ApplicationRecord
    resourcify
    belongs_to :buddy
    has_many :bookings, dependent: :destroy

    has_many :users, through: :roles, class_name: 'User', source: :users
    has_many :trainers, -> { where(roles: {name: :trainer}) }, through: :roles, class_name: 'User', source: :users
    has_many :trainees, -> { where(roles: {name: :trainee}) }, through: :roles, class_name: 'User', source: :users
    has_many :workout_session_trainees, -> { where(roles: {name: :trainee}) }, through: :roles, class_name: 'User', source: :users
    has_many :workout_session_trainers, -> { where(roles: {name: :trainer}) }, through: :roles, class_name: 'User', source: :users

    validates :name, presence: true
    validates :date, presence: true
    validates :duration, presence: true
    validates :workout_type, presence: true
    validates :workout_category, presence: true
    validates :fees, presence: true
    validates :difficulty_level, presence: true
end
