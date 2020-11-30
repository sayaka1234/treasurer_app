require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get questions_edit_url
    assert_response :success
  end

end
