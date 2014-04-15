require 'test_helper'

class ChangeyearControllerTest < ActionController::TestCase
  test "should get change" do
    get :change
    assert_response :success
  end

end
