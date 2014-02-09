class Reservation < ActiveRecord::Base
	has_many :categories
	belongs_to :restaurant
	belongs_to :customer
	validates_numericality_of :capacity, :less_than => 21
end
