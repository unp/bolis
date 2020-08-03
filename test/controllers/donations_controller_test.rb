require 'test_helper'

class DonationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get donations_create_url
    assert_response :success
  end

end
