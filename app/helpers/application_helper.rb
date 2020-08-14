module ApplicationHelper
  def average_rating(reviews)
    arr = []
    reviews.each { |review| arr << review.rating }
    (arr.inject{ |sum, el| sum + el }.to_f / arr.size).round(1)
  end
end
