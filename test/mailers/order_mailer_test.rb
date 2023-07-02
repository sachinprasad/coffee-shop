require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "notify_customer" do
    mail = OrderMailer.notify_customer
    assert_equal "Notify customer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
