class Buddy < ApplicationRecord
    resourcify

    belongs_to :user
    has_many :workout_sessions

    validates :user, presence: true
    # validate :acceptable_image
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
