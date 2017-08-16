class Room < ActiveRecord::Base
	has_many :cities
	belongs_to :user
	validates_presence_of :name ,:description,:price,:rules,:minimum_days,:address,:latitude,:longitude
	after_create :assign_role_to_host

	def send_confirmation
		RoomAdded.room_confirmation(self).deliver!
	end

	def assign_role_to_host
		role = Role.second
		self.user.role_id = role.id
		user.save
	end
end
