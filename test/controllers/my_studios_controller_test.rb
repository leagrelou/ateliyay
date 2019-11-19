require 'test_helper'

class MyStudiosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_studios_index_url
    assert_response :success
  end

  test "should get new" do
    get my_studios_new_url
    assert_response :success
  end

  test "should get create" do
    get my_studios_create_url
    assert_response :success
  end

  test "should get edit" do
    get my_studios_edit_url
    assert_response :success
  end

  test "should get update" do
    get my_studios_update_url
    assert_response :success
  end

  test "should get destroy" do
    get my_studios_destroy_url
    assert_response :success
  end

  test "should get show" do
    get my_studios_show_url
    assert_response :success
  end

end
