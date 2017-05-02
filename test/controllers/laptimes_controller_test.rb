require 'test_helper'

class LaptimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @laptime = laptimes(:one)
  end

  test "should get index" do
    get laptimes_url
    assert_response :success
  end

  test "should get new" do
    get new_laptime_url
    assert_response :success
  end

  test "should create laptime" do
    assert_difference('Laptime.count') do
      post laptimes_url, params: { laptime: { competitor_id: @laptime.competitor_id, lap_number: @laptime.lap_number, laptime: @laptime.laptime } }
    end

    assert_redirected_to laptime_url(Laptime.last)
  end

  test "should show laptime" do
    get laptime_url(@laptime)
    assert_response :success
  end

  test "should get edit" do
    get edit_laptime_url(@laptime)
    assert_response :success
  end

  test "should update laptime" do
    patch laptime_url(@laptime), params: { laptime: { competitor_id: @laptime.competitor_id, lap_number: @laptime.lap_number, laptime: @laptime.laptime } }
    assert_redirected_to laptime_url(@laptime)
  end

  test "should destroy laptime" do
    assert_difference('Laptime.count', -1) do
      delete laptime_url(@laptime)
    end

    assert_redirected_to laptimes_url
  end
end
