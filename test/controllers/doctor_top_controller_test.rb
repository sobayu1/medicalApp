require 'test_helper'

class DoctorTopControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get doctor_top_home_url
    assert_response :success
  end

  test "should get help" do
    get doctor_top_help_url
    assert_response :success
  end

end
