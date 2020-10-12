require 'test_helper'

class WorldsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get worlds_index_url
    assert_response :success
  end

end
