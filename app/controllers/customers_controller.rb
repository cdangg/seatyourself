class CustomersController < ApplicationController
  def new
  	@customer = Customer.new
  end

  def create
  	@customer = Customer.new(customer_params)
  	if @customer.save
  		redirect_to restaurants_url, :notice => "Signed up!"
  	else
  		render "new"
  	end
  end

  def customer_params
  	params.require(:customer).permit(:first_name, :last_name, :email, :password, :password_confirmation, :telephone)
  end
end
