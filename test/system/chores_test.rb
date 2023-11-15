require "application_system_test_case"

class ChoresTest < ApplicationSystemTestCase
  setup do
    @chore = chores(:one)
  end

  test "visiting the index" do
    visit chore_index_url
    assert_selector "h3", text: @chore.title
  end

  # test "should create chore" do
  #   visit chores_url
  #   click_on "New chore"

  #   click_on "Create Chore"

  #   assert_text "Chore was successfully created"
  #   click_on "Back"
  # end

  # test "should update Chore" do
  #   visit chore_url(@chore)
  #   click_on "Edit this chore", match: :first

  #   click_on "Update Chore"

  #   assert_text "Chore was successfully updated"
  #   click_on "Back"
  # end

  # test "should destroy Chore" do
  #   visit chore_url(@chore)
  #   click_on "Destroy this chore", match: :first

  #   assert_text "Chore was successfully destroyed"
  # end
end
