require 'test_helper'

class PostResultsControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get post_results_add_url
    assert_response :success
  end

end
