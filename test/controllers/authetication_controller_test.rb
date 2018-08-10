require 'test_helper'

class AutheticationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get authetication_index_url
    assert_response :success
  end

end
