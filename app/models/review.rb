class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  scope :most_recent, -> { order(created_at: :desc) }
end
