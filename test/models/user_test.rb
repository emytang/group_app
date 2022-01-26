require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(first_name: "A1", last_name: "a1", email: "a1@example.com")
    @user2 = User.new(first_name: "A2", last_name: "a2", email: "a2@example.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.first_name = "   "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "   "
    assert_not @user.valid?
  end

  test "email should be correct format" do
    @user.email = "aaaa"
    assert_not @user.valid?
  end

  test "email addresses should be saved as lowercase" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end
end
