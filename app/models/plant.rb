class Plant < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :cycle, presence: true
  validates :user, presence: true

  mount_uploader :profile_photo, ProfilePhotoUploader

  def display_avatar(user)
   unless user.avatar.nil?
     image_tag(user.avatar.file_name)
   else
     image_tag("app/assets/images/sprout.png")
    end
 end
end
