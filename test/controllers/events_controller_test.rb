require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get open_slots" do
    get events_open_slots_url
    assert_response :success
  end

end
