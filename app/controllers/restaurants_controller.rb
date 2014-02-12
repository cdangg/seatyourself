class RestaurantsController < ApplicationController
  def index
  	@restaurants = Restaurant.all
  end

  def new
  	@restaurant = Restaurant.new
  end

  def show
  	@restaurant = Restaurant.find(params[:id])

  	if current_customer
  		@reservation = @restaurant.reservations.build
  	end

  end

  def edit
  	@restaurant = Restaurant.find(params[:id])
  end

  def create
  	@restaurant = Restaurant.new(restaurant_params)
    @category = Category.new(restaurant_params)
  	if @restaurant.save
  		redirect_to restaurants_url
  	else
  		render :new
  	end
  end

  def update
  	@restaurant = Restaurant.find(params[:id])
  	if @restaurant.update_attributes(restaurant_params)
  		redirect_to restaurant_path(@restaurant)
  	end
  end

  private

  def restaurant_params
  	params.require(:restaurant).permit(:name, :address, :summary, :capacity, :image, :category_id)
  end
end
