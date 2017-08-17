require 'test_helper'

class AdminRoomConfirmationTest < ActionMailer::TestCase
  test "authorize_room" do
    mail = AdminRoomConfirmation.authorize_room
    assert_equal "Authorize room", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
