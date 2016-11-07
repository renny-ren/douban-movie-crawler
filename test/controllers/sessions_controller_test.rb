require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get sessions_create_url
    assert_response :redirect
  end

  test 'login with WRONG username or password' do
    post sessions_create_url, params: {:username => "12", :password => "1"}
  
    assert_redirected_to new_sessions_path
    assert_equal 'Invalid username or password!', flash[:notice]
  end


  test 'login with RIGHT username or password' do
    post sessions_create_url, params: {:username => "1", :password => "1"}

    assert_redirected_to pages_path
    assert_equal "Welcome, #{@user.username}", flash[:notice]
  end

  test 'should be admin' do
    post sessions_create_url, params: {:username => "admin", :password => "admin"}

    assert_redirected_to pages_path
    assert_equal session[:admin], true
  end
end