require 'test_helper'

class JoinEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get join_events_index_url
    assert_response :success
  end

  test "should get show" do
    get join_events_show_url
    assert_response :success
  end

  test "should get new" do
    get join_events_new_url
    assert_response :success
  end

  test "should get edit" do
    get join_events_edit_url
    assert_response :success
  end

end
