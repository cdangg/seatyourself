class ReservationsController < ApplicationController

	before_filter :load_restaurant, except: [:index, :edit]
	# before_filter :load_customer, except: [:index, :create]

  def index
    if params[:customer_id]
      @object = Customer.find(params[:customer_id])
    elsif params[:restaurant_id]
      @object = Restaurant.find(params[:restaurant_id])
    end
    @reservations = @object.reservations.all
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def show
  	@reservation = Reservation.find(params[:id])
  	# @reservation = @customer.reservations.build(reservation_params)
  	# @reservation.customer_id = current_customer.id
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
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def destroy
  	@reservation = Reservation.find(params[:id])
  	@reservation.destroy
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update_attributes(reservation_params)
      redirect_to customer_path(current_customer)
    end
  end

  private
  def reservation_params
  	params.require(:reservation).permit(:day, :time, :num_of_customers, :restaurant_id, :customer_id)
  end

  def load_restaurant
  	@restaurant = Restaurant.find(params[:restaurant_id])
  end

  # def load_customer
  # 	@customer = Customer.find(params[:customer_id])
  # end
end
