class ReviewsController < ApplicationController
  def create
    @review = Review.new(reviews_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    @review.save if @review.valid?
    redirect_to restaurant_path(@restaurant)
    # render :new, status: :unprocessable_entity
  end

  private

  def reviews_params
    params.require(:review).permit(:rating, :content)
  end
end
ra
