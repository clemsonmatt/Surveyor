require 'test_helper'

class Manage::DefaultControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manage_default_index_url
    assert_response :success
  end

end
