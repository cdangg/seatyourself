class Restaurant < ActiveRecord::Base
	validates_numericality_of :capacity, :greater_than => 0, :less_than => 101
	has_many :reservations
	has_many :customers, :through => :reservations

end
