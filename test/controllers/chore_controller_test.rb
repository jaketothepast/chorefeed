require "test_helper"

class ChoreControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_chore_url
    assert_response :success
  end

  test "should get index" do
    get chore_url
    assert_response :success
  end

  test "should get show" do
    get chore_show_url
    assert_response :success
  end

  test "should get edit" do
    get chore_edit_url
    assert_response :success
  end

  test "should get delete" do
    get chore_delete_url
    assert_response :success
  end
end
