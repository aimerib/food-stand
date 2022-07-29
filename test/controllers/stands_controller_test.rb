require "test_helper"

class StandsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stand = stands(:one)
  end

  test "should get index" do
    get stands_url
    assert_response :success
  end

  test "should show stand" do
    get stand_url(@stand)
    assert_response :success
  end
end
