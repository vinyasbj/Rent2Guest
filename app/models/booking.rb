class Booking < ActiveRecord::Base
	belongs_to :room
	belongs_to :user
	validates_presence_of :start_date,:end_date ,:user_id
	validate :booking_validation

	def booking_validation
		bookings = Booking.where(room_id: self.room_id)
		bookings.each do |booking|
			# binding.pry
			if (booking.start_date..booking.end_date).include?(self.start_date) || (booking.start_date..booking.end_date).include?(self.end_date) || booking.start_date < self.start_date || booking.end_date > self.end_date
				self.errors.add(:base ,"cant book in this dates")
				break
			end
		end
	end
end
