require 'test_helper'

class Manage::PersonControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manage_person_index_url
    assert_response :success
  end

end
