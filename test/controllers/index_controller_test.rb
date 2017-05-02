require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get index_index_url
    assert_response :success
  end

  test "should get signup" do
    get index_signup_url
    assert_response :success
  end

  test "should get results" do
    get index_results_url
    assert_response :success
  end

  test "should get history" do
    get index_history_url
    assert_response :success
  end

end
