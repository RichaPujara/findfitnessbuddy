class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :buddy, dependent: :destroy
  has_many :bookings, :dependent => :destroy
  has_many :workout_sessions, through: :roles, source: :resources, source_type: :workout_sessions 
  has_many :workout_session_trainees, -> { where(roles: {name: :trainee}) }, through: :roles, class_name: 'User', source: :workout_sessions
  has_many :workout_session_trainers, -> { where(roles: {name: :trainer}) }, through: :roles, class_name: 'User', source: :workout_sessions

end
