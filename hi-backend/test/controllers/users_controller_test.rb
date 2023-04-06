require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  fixtures do 
    
  end

  test "should get authenticated user" do
    get users_url
    assert_response :success
  end
end
