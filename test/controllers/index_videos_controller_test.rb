require 'test_helper'

class IndexVideosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @index_video = index_videos(:one)
  end

  test "should get index" do
    get index_videos_url
    assert_response :success
  end

  test "should get new" do
    get new_index_video_url
    assert_response :success
  end

  test "should create index_video" do
    assert_difference('IndexVideo.count') do
      post index_videos_url, params: { index_video: { youtube: @index_video.youtube } }
    end

    assert_redirected_to index_video_url(IndexVideo.last)
  end

  test "should show index_video" do
    get index_video_url(@index_video)
    assert_response :success
  end

  test "should get edit" do
    get edit_index_video_url(@index_video)
    assert_response :success
  end

  test "should update index_video" do
    patch index_video_url(@index_video), params: { index_video: { youtube: @index_video.youtube } }
    assert_redirected_to index_video_url(@index_video)
  end

  test "should destroy index_video" do
    assert_difference('IndexVideo.count', -1) do
      delete index_video_url(@index_video)
    end

    assert_redirected_to index_videos_url
  end
end
