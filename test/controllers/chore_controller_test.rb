require "test_helper"

class ChoreControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_chore_url
    assert_response :success
  end

  test "should get index" do
    get chore_index_url
    assert_response :success
  end

  test "should get show" do
    get chore_url(Chore.first.id)
    assert_response :success
  end

  test "should get edit" do
    get edit_chore_url(Chore.first.id)
    assert_response :success
  end
end
