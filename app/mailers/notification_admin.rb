class NotificationAdmin < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_admin.room_confirmation.subject
  #
  def room_confirmation(room)
    @room = room

    mail to: "#{room.user.email}",subject: "A room has been addded ,which needs to authroized -#{room.id}"
  end
end
