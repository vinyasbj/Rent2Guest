# Preview all emails at http://localhost:3000/rails/mailers/notification_admin
class NotificationAdminPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification_admin/room_confirmation
  def room_confirmation
    NotificationAdmin.room_confirmation
  end

end
