class Plant < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :cycle, presence: true
end
