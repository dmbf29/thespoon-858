class RestaurantsController < ApplicationController

  def chef
    @restaurant = Restaurant.find(params[:id])
    # render 'chef.html.erb'
  end

  def top
    # load all of the info we need
    @restaurants = Restaurant.where(rating: 5)
    # we render a view (by default, it shows the view with same name as action)
  end

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
    # render 'show.html.erb'
  end

  def new
    @restaurant = Restaurant.new # for the form
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      # if it does save, redirect to the #show page
      redirect_to restaurant_path(@restaurant)
    else
      # if it doesn't save, show the new form again
      render 'new.html.erb'
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id]) # for the form
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render 'edit.html.erb'
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def restaurant_params
    # Strong params - whitelisting the params i want to accept
    params.require(:restaurant).permit(:name, :address, :rating, :category)
  end
end
