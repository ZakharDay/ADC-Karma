require 'test_helper'

class Api::ServicesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_services_index_url
    assert_response :success
  end

  test "should get show" do
    get api_services_show_url
    assert_response :success
  end

end
