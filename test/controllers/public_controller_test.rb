require "test_helper"

class PublicControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_path
    assert_response :success
  end

  test "should get search" do
    post "/", params: { search_term: "Japanese" }
    assert_response :found
  end
end
