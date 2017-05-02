require 'test_helper'

class CompetitorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @competitor = competitors(:one)
  end

  test "should get index" do
    get competitors_url
    assert_response :success
  end

  test "should get new" do
    get new_competitor_url
    assert_response :success
  end

  test "should create competitor" do
    assert_difference('Competitor.count') do
      post competitors_url, params: { competitor: { finish_time: @competitor.finish_time, group_id: @competitor.group_id, laps: @competitor.laps, name: @competitor.name, place_in_group: @competitor.place_in_group, total_time: @competitor.total_time, year: @competitor.year } }
    end

    assert_redirected_to competitor_url(Competitor.last)
  end

  test "should show competitor" do
    get competitor_url(@competitor)
    assert_response :success
  end

  test "should get edit" do
    get edit_competitor_url(@competitor)
    assert_response :success
  end

  test "should update competitor" do
    patch competitor_url(@competitor), params: { competitor: { finish_time: @competitor.finish_time, group_id: @competitor.group_id, laps: @competitor.laps, name: @competitor.name, place_in_group: @competitor.place_in_group, total_time: @competitor.total_time, year: @competitor.year } }
    assert_redirected_to competitor_url(@competitor)
  end

  test "should destroy competitor" do
    assert_difference('Competitor.count', -1) do
      delete competitor_url(@competitor)
    end

    assert_redirected_to competitors_url
  end
end
