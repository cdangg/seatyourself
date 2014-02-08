class Reservation < ActiveRecord::Base
	has_many :categories
	belongs_to :restaurant
	belongs_to :customer
end
