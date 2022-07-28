require "application_system_test_case"

class StandsTest < ApplicationSystemTestCase
  setup do
    @stand = stands(:one)
  end

  test "visiting the index" do
    visit stands_url
    assert_selector "h1", text: "Stands"
  end

  test "should create stand" do
    visit stands_url
    click_on "New stand"

    fill_in "Address", with: @stand.address
    fill_in "Description", with: @stand.description
    fill_in "Facility type", with: @stand.facility_type
    fill_in "Latitude", with: @stand.latitude
    fill_in "Longitude", with: @stand.longitude
    fill_in "Name", with: @stand.name
    fill_in "Permit", with: @stand.permit
    fill_in "Status", with: @stand.status
    click_on "Create Stand"

    assert_text "Stand was successfully created"
    click_on "Back"
  end

  test "should update Stand" do
    visit stand_url(@stand)
    click_on "Edit this stand", match: :first

    fill_in "Address", with: @stand.address
    fill_in "Description", with: @stand.description
    fill_in "Facility type", with: @stand.facility_type
    fill_in "Latitude", with: @stand.latitude
    fill_in "Longitude", with: @stand.longitude
    fill_in "Name", with: @stand.name
    fill_in "Permit", with: @stand.permit
    fill_in "Status", with: @stand.status
    click_on "Update Stand"

    assert_text "Stand was successfully updated"
    click_on "Back"
  end

  test "should destroy Stand" do
    visit stand_url(@stand)
    click_on "Destroy this stand", match: :first

    assert_text "Stand was successfully destroyed"
  end
end
