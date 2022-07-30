require "application_system_test_case"

class PublicTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_path
    fill_in "search_term", with: "japanese"
    click_on "Search"

    assert_text "Soba Noodle"
  end
end
