class Room < ActiveRecord::Base
	has_many :cities
	belongs_to :user
	has_many :amenity_rooms
	has_many :amenities ,through: :amenity_rooms
	has_many :images 

	validates_presence_of :name ,:description,:price,:rules,:minimum_days,:address,:latitude,:longitude
	after_create :assign_role_to_host
	after_create :send_confirmation
	after_update :admin_room_confirmation


	def send_confirmation
		# self.user.where(role_id: 1)
		NotificationAdmin.room_confirmation(self).deliver!
	end
	
	def admin_room_confirmation
		AdminRoomConfirmation.authorize_room(self).deliver!
	end

	def assign_role_to_host
		role_admin = Role.first
		role_host= Role.second
		if self.user.role_id != role_admin.id 	
			self.user.role_id = role_host.id
			user.save
		end
	end
end
