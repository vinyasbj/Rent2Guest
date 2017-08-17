class AdminRoomConfirmation < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_room_confirmation.authorize_room.subject
  #
  def authorize_room(room)
  	@room = room
  	mail to: "#{room.user.email}", subject: "Your room has been authroized"
  end
end
