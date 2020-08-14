class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :reviews

  scope :by_rating, -> { order(rating: :desc) }

  def update_rating(restaurant)
    arr = []
    restaurant.reviews.each { |review| arr << review.rating }
    restaurant.rating = (arr.inject{ |sum, el| sum + el }.to_f / arr.size).round(1)
  end
end
