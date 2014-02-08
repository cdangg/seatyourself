class ReservationsController < ApplicationController
	before_filter :load_restaurant
  def show
  	@reservation = Reservation.find(params[:id])
  end

  def create
  	@reservation = @restaurant.reservations.build(reservation_params)
  	@reservation.customer_id = current_customer.id

  	if @reservation.save
  		redirect_to restaurants_path, notice: "Reservation successfully created"
  	else
  		render :action => :show
  	end
  end

  def edit
  	@reservation = Reservation.find(params[:id])
  end

  def destroy
  	@reservation = Reservation.find(params[:id])
  	@reservation.destroy
  end

  private
  def reservation_params
  	params.require(:reservation).permit(:day, :time, :num_of_customers, :restaurant_id, :customer_id)
  end

  def load_restaurant
  	@restaurant = Restaurant.find(params[:restaurant_id])

  end
end
