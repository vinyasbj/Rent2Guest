class Room < ActiveRecord::Base
	has_many :cities
	belongs_to :user
	validates_presence_of :name ,:description,:price,:rules,:minimum_days,:address,:latitude,:longitude

	def send_confirmation
		RoomAdded.room_confirmation(self).deliver!
	end
end
