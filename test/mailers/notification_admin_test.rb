require 'test_helper'

class NotificationAdminTest < ActionMailer::TestCase
  test "room_confirmation" do
    mail = NotificationAdmin.room_confirmation
    assert_equal "Room confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
