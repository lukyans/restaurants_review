class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.new(params[:review].permit(:rating, :comment))
    @review.user = current_user
    @review.save

    email_info = { user: current_user,
                   review: @review,
                   restaurant: @restaurant
                 }
    RestaurantOwnerNotifierMailer.inform(email_info, @restaurant.user.email).deliver_now
    flash[:notice] = "Thank you so much for taking the time to leave us review."

    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@restaurant)
  end
end
