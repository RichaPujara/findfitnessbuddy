class Buddy < ApplicationRecord
    resourcify

    belongs_to :user
    has_many :bookings, :dependent => :destroy
    has_many :workout_sessions #, through: :roles, source: :resources, source_type: :workout_sessions 
    # has_many :workout_session_trainees, -> { where(roles: {name: :trainee}) }, through: :roles, class_name: 'Buddy', source: :workout_sessions
    # has_many :workout_session_trainers, -> { where(roles: {name: :trainer}) }, through: :roles, class_name: 'Buddy', source: :workout_sessions


    validates :user, presence: true
    validates :name, presence: true
    validates :description, length: {maximum: 500}
    validates :qualification, length: {maximum: 100}
    validates :location, presence:true
    # validates :acceptable_image
    has_one_attached :avatar

    # def acceptable_image
    #     return unless avatar.attached?

    #     unless avatar.byte_size <= 1.megabyte
    #         errors.add(:avatar, "is too big")
    #     end

    #     acceptable_types = ["image/jpeg", "image/png"]
    #     unless acceptable_types.include?(avatar.content_type)
    #         errors.add(:avatar, "must be a JPEG or PNG")
    #     end
    # end

end
