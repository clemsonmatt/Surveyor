require 'test_helper'

class Survey::QuestionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get survey_question_new_url
    assert_response :success
  end

end
