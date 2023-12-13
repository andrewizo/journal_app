# test/controllers/sessions_controller_test.rb
require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:valid_user)  # Make sure you have a fixture named 'valid_user'
  end

  test "should get new (login) page" do
    get login_url
    assert_response :success
  end

  test "should login user with valid credentials" do
    post login_url, params: { user: { email: @user.email, password: "password" } }
    
    assert_redirected_to root_url
    assert_not_nil session[:user_id]
    assert_equal @user.id, session[:user_id]
  end

  test "should fail login with invalid credentials" do
    post login_url, params: { user: { email: "nonexistent@example.com", password: "invalid_password" } }
    
    assert_response :unprocessable_entity
    assert_nil session[:user_id]
  end
end
