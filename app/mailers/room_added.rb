class RoomAdded < ApplicationMailer

	default from: "from@example.com"
	
	def room_confirmation(room)
		@room = room
		
		mail to: "#{room.user.email}",subject: "A room has been addded ,which needs to authroized -#{room.id}"
	end
end
