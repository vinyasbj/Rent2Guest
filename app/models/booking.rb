class Booking < ActiveRecord::Base
	belongs_to :room
	belongs_to :user
	validates_presence_of :start_date,:end_date ,:user_id
	validate :booking_validation

	def booking_validation
		bookings = Booking.where(room_id: self.room_id)
		bookings.each do |booking|
			booking_array = []
			booking_array = (self.start_date..self.end_date).to_a
			if booking_array.include?(self.start_date) || booking_array.include?(self.end_date)
				self.errors.add(:base ,"cant book in this dates")
			elsif self.start_date >  self.end_date || self.end_date < self.start_date
				self.errors.add(:base ,"end date cannot be less than start date")
			end
		end
	end
end
