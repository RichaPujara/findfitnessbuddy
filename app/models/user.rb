class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one :profile
  has_one :business_profile
  has_many :workout_sessions , dependent: :destroy
  has_many :bookings, dependent: :destroy
end
