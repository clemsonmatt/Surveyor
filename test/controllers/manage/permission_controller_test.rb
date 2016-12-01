require 'test_helper'

class Manage::PermissionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get manage_permission_new_url
    assert_response :success
  end

end
