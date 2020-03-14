# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get users_index_url
    assert_response :success
  end

  test 'should get show' do
    get users_show_url
    assert_response :success
  end

  test 'should get edit' do
    get users_edit_url
    assert_response :success
  end

  test 'should get withdraw' do
    get users_withdraw_url
    assert_response :success
  end

  test 'should get joining_events' do
    get users_joining_events_url
    assert_response :success
  end

  test 'should get my_events' do
    get users_my_events_url
    assert_response :success
  end
end
