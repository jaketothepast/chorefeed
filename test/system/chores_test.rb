require "application_system_test_case"

class ChoresTest < ApplicationSystemTestCase
  setup do
    @chore = chores(:one)
  end

  test "visiting the index" do
    visit chore_index_url
    assert_selector "h3", text: @chore.title
  end

  test "should complete chore" do
    visit chore_index_url
    first('.card a').click
    assert_selector "h3", text: chores(:two).title
  end
end
