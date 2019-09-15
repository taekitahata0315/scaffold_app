require 'test_helper'

class SeesionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get seesions_new_url
    assert_response :success
  end

end
