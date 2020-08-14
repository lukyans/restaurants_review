class ApplicationController < ActionController::Base
  def update_ratings
    Restaurant.all.each do |restaurant|
      restaurant.update_rating(restaurant)
      restaurant.save
    end
  end
end
