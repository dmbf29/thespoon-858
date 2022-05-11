class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@review.restaurant)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    # we just remove the review info from the DB, we still have the instance
    redirect_to restaurant_path(@review.restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
