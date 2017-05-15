require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "sign_up_confirmation" do
    mail = UserMailer.sign_up_confirmation
    assert_equal "Sign up confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
