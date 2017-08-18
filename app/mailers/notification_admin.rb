class NotificationAdmin < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_admin.room_confirmation.subject
  #
  def room_confirmation(room)
  	@room = room
    @room1 = User.find_by(role_id: Role.find_by(name: "admin").id).email
    mail to: "#{@room1}",subject: "A room has been addded ,which needs to authroized -#{room.id}"
  end
end
