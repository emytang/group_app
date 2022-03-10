require "application_system_test_case"

class GroupsTest < ApplicationSystemTestCase
  setup do
    @group = groups(:one)
    @user = users(:one)
    @team = user_groups(:one)
  end

  test "visiting the index" do
    visit groups_url
    assert_selector "h4", text: "All Groups"
  end

  test "creating a Group" do
    visit groups_url
    click_on "Add New Group"

    fill_in "Description", with: "aaaa" #@group.description
    fill_in "Email", with: "a@g.v" #@group.email
    fill_in "Name", with: "g1" #@group.name
    click_on "Create Group"

    assert_text "Group was successfully created"
  end

  
  
  test "updating a Group" do
    visit group_path @group
    click_on "Edit"

    fill_in "Description", with: @group.description
    fill_in "Email", with: @group.email
    fill_in "Name", with: @group.name
    click_on "Update Group"

    assert_text "Group was successfully updated"
  end

  test "destroying a Group" do
    visit groups_url
    first('button.dropdown-toggle').click
    click_on("Delete")

    page.driver.browser.switch_to.alert.accept

    assert_text "Group was successfully destroyed"
  end
  
  test "delete a User from a Group" do
    visit group_path @group
    click_on("ADD")
    click_on('Add')

    click_on("Delete")

    page.driver.browser.switch_to.alert.accept

    assert_text "User was successfully destroyed in the group"
    
  end
  
  test "add a User to a Group" do
    visit group_url @group
    click_on("ADD")

    click_on('Add')

    assert_text "User was successfully added"
    
  end
  
  


end
