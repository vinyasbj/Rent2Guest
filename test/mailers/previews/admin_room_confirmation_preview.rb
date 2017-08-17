# Preview all emails at http://localhost:3000/rails/mailers/admin_room_confirmation
class AdminRoomConfirmationPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/admin_room_confirmation/authorize_room
  def authorize_room
    AdminRoomConfirmation.authorize_room
  end

end
