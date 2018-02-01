require 'test_helper'

class KeyPairControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get key_pair_show_url
    assert_response :success
  end

  test "should get new" do
    get key_pair_new_url
    assert_response :success
  end

  test "should get update" do
    get key_pair_update_url
    assert_response :success
  end

end
