require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_response :success
  end

  test "should get send_to_url" do
    get home_send_to_url_url
    assert_response :success
  end
end
