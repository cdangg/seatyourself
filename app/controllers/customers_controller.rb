class CustomersController < ApplicationController
  def new
  	@customer = Customer.new
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def create
  	@customer = Customer.new(customer_params)
  	if @customer.save
  		redirect_to restaurants_url, :notice => "Signed up!"
  	else
  		render "new"
  	end
  end

  def show
    @customer = Customer.find(params[:id])
    @restaurants = current_customer.restaurants.all
    @reservations = current_customer.reservations.all
    # @reservation = current_customer.reservations.find(params[:id])
    # @restaurant = current_customer.restaurants.find(params[:id])
  end

  def index
    @reservations = current_customer.reservations.all
  end

  private

  def customer_params
  	params.require(:customer).permit(:first_name, :last_name, :email, :password, :password_confirmation, :telephone)
  end
end
