require "application_system_test_case"

class GroupsTest < ApplicationSystemTestCase
  setup do
    @group = groups(:one)
  end

  test "visiting the index" do
    visit groups_url
    assert_selector "h4", text: "All Groups"
  end

  test "creating a Group" do
    visit groups_url
    find('button').click
    click_on "Add New Group"
    

    fill_in "Description", with: @group.description
    fill_in "Email", with: @group.email
    fill_in "Name", with: @group.name
    click_on "Create Group"

    assert_text "Group was successfully created"
  end

  # test "updating a Group" do
  #   visit groups_url
  #   click_on "Edit", match: :first
    

  #   fill_in "Description", with: @group.description
  #   fill_in "Email", with: @group.email
  #   fill_in "Name", with: @group.name
  #   click_on "Update Group"

  #   assert_text "Group was successfully updated"
  #   click_on "Back"
  # end

  # test "destroying a Group" do
  #   visit groups_url
  #   page.accept_confirm do
  #     click_on "Destroy", match: :first
  #   end

  #   assert_text "Group was successfully destroyed"
  # end
  
  
  test "updating a Group" do
    visit groups_url
    find('button.dropdown-toggle').click
    click_on("View")
    find('button').click
    click_on "Edit"

    fill_in "Description", with: @group.description
    fill_in "Email", with: @group.email
    fill_in "Name", with: @group.name
    click_on "Update Group"

    assert_text "Group was successfully updated"
  end

  test "destroying a Group" do
    visit groups_url
    find('button.dropdown-toggle').click
    click_on("Delete")
    
    page.accept_confirm do
      click_on "OK", match: :first
    end

    assert_difference('Group.count', -1) do
      delete group_url(@group)
    end
    assert_text "Group was successfully destroyed"
  end
  
  test "delete a User from a Group" do
    visit group_url
    find('button').click
    click_on("Delete")
    
    page.accept_confirm do
      click_on "OK", match: :first
    end

    assert_text "User was successfully destroyed in the group"
    
  end
  
  test "add a User to a Group" do
    visit group_url
    find('button').click
    click_on("Add")
    
    find('button').click
    click_on("Add")

    assert_text "User was successfully added"
    
  end
  
  


end
