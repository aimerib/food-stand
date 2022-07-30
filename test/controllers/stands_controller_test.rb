require "test_helper"

class StandsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stand = stands(:one)
  end

  test "should error when visiting index" do
    assert_raise ActionController::UrlGenerationError do
      get stand_url
    end
  end

  test "should show stand" do
    get stand_url(@stand)
    assert_response :success
  end
end
