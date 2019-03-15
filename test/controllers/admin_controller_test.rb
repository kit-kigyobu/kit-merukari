require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get user" do
    get admin_user_url
    assert_response :success
  end

  test "should get post" do
    get admin_post_url
    assert_response :success
  end

  test "should get transaction" do
    get admin_transaction_url
    assert_response :success
  end

end
