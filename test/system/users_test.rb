require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h4", text: "All Users"
  end

  test "creating a User" do
    visit users_url
    click_on "Add New User"

    fill_in "Email", with: @user.email
    fill_in "First name", with: @user.first_name
    fill_in "Last name", with: @user.last_name
    click_on "Create User"

    assert_text "User was successfully created"
  end

  
  test "updating a User" do
    visit user_url @user
    click_on "Edit"

    fill_in "Email", with: @user.email
    fill_in "First name", with: @user.first_name
    fill_in "Last name", with: @user.last_name
    click_on "Update User"

    assert_text "User was successfully updated"
  end
  
  test "destroying a User" do
    visit users_url
    find('button.dropdown-toggle').click
    click_on("Delete")

    page.driver.browser.switch_to.alert.accept

    assert_text "User was successfully destroyed"
  end
  
  
end
