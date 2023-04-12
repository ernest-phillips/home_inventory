# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get new_user_path
    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count') do
      post users_url, params: { user: {
        email: 'test@example.com',
        password: 'password',
        first_name: 'Test',
        last_name: 'User'
      } }
    end

    assert_redirected_to users_path
  end

  test 'should not create user with invalid params' do
    assert_no_difference('User.count') do
      post users_url, params: { user: { email: '', password: '', first_name: '', last_name: '' } }
    end

    assert_template :new
  end
end
