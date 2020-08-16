require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get signout" do
    get user_signout_url
    assert_response :success
  end

end
