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
    within first('.chore') do
      click_on 'Complete Chore'
    end
    assert_selector "h3", text: chores(:two).title
  end

  test "edit_chore_shows" do
    visit chore_index_url
    first('h3 a').click
    assert_text "Edit this chore"
  end

  test "creates a new chore" do
    visit chore_index_url
    click_on 'New Chore'
    fill_in 'title', with: 'New Chore Title'
    fill_in 'desc', with: 'Chore Description'
    fill_in 'due_date', with: (DateTime.now.to_date + 10.day).to_s
    click_on 'Create'

    assert_text 'New Chore Title'
    assert_text 'Chore Description'
    assert_selector 'h3', count: 3
  end

  test "feed is priority sorted" do
    visit chore_index_url
    within first('.chore') do
      assert_text chores(:one).title
    end
  end
end
