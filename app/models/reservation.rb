class Reservation < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :customer
	validates_numericality_of :num_of_customers, :greater_than => 2, :less_than => 21
	# validate :max_reservations

	# def max_reservations
	# 	if Reservation.sum(:num_of_customers) > 25
	# 		errors.add(:num_of_customers, "Restaurant is fully booked!")
	# 	end
	# end

end
