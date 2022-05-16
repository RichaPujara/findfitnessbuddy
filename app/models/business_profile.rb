class BusinessProfile < ApplicationRecord
  belongs_to :user
  after_create :assign_role_to_user

  def assign_role_to_user
    self.add_role :trainer unless self.has_role? :trainer
  end
end
