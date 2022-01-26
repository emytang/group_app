require "test_helper"

class GroupTest < ActiveSupport::TestCase

  def setup
    @group = Group.new(name: "G1", email: "g1@example.com", description: "ggg")
    @group2 = Group.new(name: "G2", email: "g2@example.com", description: "ggg")
  end

  test "should be valid" do
    assert @group.valid?
  end

  test "name should be present" do
    @group.name = "   "
    assert_not @group.valid?
  end

  test "email addresses should be unique" do
    duplicate_group = @group.dup
    @group.save
    assert_not duplicate_group.valid?
  end

  test "email addresses should be saved as lowercase" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @group.email = mixed_case_email
    @group.save
    assert_equal mixed_case_email.downcase, @group.reload.email
  end

end
