require 'test_helper'

class StatsControllerTest < ActionDispatch::IntegrationTest
  test "should get retrieve" do
    get stats_retrieve_url
    assert_response :success
  end

end
