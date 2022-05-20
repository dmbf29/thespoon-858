class ReviewsController < ApplicationController

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      respond_to do |format|
        format.html { redirect_to restaurant_path(@review.restaurant, anchor: "review-#{@review.id}") }
        format.js # look for a JS view with the same action name
      end
    else
      render 'restaurants/show'
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
