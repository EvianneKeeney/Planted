class Plant < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :cycle, presence: true
  validates :user, presence: true

  mount_uploader :profile_photo, ProfilePhotoUploader
end
