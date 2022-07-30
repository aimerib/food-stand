require "test_helper"

class UserFlowsTest < ActionDispatch::IntegrationTest
  setup do
    @stand = stands(:one)
  end
  test "can create search a food stand and see result" do
    get "/"
    assert_response :success

    post "/",
      params: { search_term: "japanese" }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "strong", @stand.name
  end
end
