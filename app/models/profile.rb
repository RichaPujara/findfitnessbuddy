class Profile < ApplicationRecord
  resourcify
  belongs_to :user
  has_one :address
  accepts_nested_attributes_for :address, allow_destroy: true
end
