class Reservation < ActiveRecord::Base
	has_many :categories
	belongs_to :restaurant
	belongs_to :customer
	validates_numericality_of :num_of_customers, :greater_than => 2, :less_than => 21
end
