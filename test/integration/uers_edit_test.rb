require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:one)
  end

  # test "unsuccessful edit" do
  #   get edit_user_path(@user)
  #   assert_template 'users/edit'
  #   patch user_path(@user), params: { user: { first_name:  "",
  #                                             last_name:  "a1",
  #                                             email: "foo@invalid"
  #                                              } }
  #
  #   assert_template 'users/edit'
  # end

  # test "successful edit" do
  #     get edit_user_path(@user)
  #     assert_template 'users/edit'
  #     name  = "a5"
  #     email = "foo@bar.c"
  #     patch user_path(@user), params: { user: { first_name:  "a5",
  #                                               last_name:  "a5",
  #                                               email: "foo@bar.c" } }
  #     assert_redirected_to @user
  #     @user.reload
  #     assert_equal name,  @user.name
  #     assert_equal email, @user.email
  #   end
end