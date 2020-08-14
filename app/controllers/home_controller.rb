class HomeController < ApplicationController
  before_action :update_ratings

  def index
    @restaurants = Restaurant.by_rating.paginate(page: params[:page], per_page: 3)
  end
end
