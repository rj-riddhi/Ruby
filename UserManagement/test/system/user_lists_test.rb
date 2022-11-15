require "application_system_test_case"

class UserListsTest < ApplicationSystemTestCase
  setup do
    @user_list = user_lists(:one)
  end

  test "visiting the index" do
    visit user_lists_url
    assert_selector "h1", text: "User lists"
  end

  test "should create user list" do
    visit user_lists_url
    click_on "New user list"

    fill_in "Email", with: @user_list.email
    fill_in "First name", with: @user_list.first_name
    fill_in "Insta", with: @user_list.insta_id
    fill_in "Last name", with: @user_list.last_name
    fill_in "Phone", with: @user_list.phone
    click_on "Create User list"

    assert_text "User list was successfully created"
    click_on "Back"
  end

  test "should update User list" do
    visit user_list_url(@user_list)
    click_on "Edit this user list", match: :first

    fill_in "Email", with: @user_list.email
    fill_in "First name", with: @user_list.first_name
    fill_in "Insta", with: @user_list.insta_id
    fill_in "Last name", with: @user_list.last_name
    fill_in "Phone", with: @user_list.phone
    click_on "Update User list"

    assert_text "User list was successfully updated"
    click_on "Back"
  end

  test "should destroy User list" do
    visit user_list_url(@user_list)
    click_on "Destroy this user list", match: :first

    assert_text "User list was successfully destroyed"
  end
end
