require "test_helper"

class ChoreTest < ActiveSupport::TestCase
  test "should not save chore without title, and desc" do
    chore = Chore.new
    assert_not chore.save, "Saved the chore without title, or desc"
  end

  test "should save chore" do
    chore = Chore.new
    chore.title = "Hello"
    chore.desc = "desc"
    chore.due_date = DateTime.now + 10
    assert chore.save, "Saved the chore without a title"
  end

  test "should only allow due date greater than now" do
    chore = Chore.new
    chore.title = 'hello'
    chore.desc = 'desc'
    chore.due_date = DateTime.now - 10
    assert !chore.save
    assert chore.errors[:due_date].first == 'newer than now'
  end

  test 'cannot recomplete chore' do
    chore = Chore.new
    chore.title = 'hello'
    chore.desc = 'desc'
    chore.due_date = DateTime.now + 10
    assert chore.save
    assert chore.update(completed_at: DateTime.now + 10)
    assert !chore.update(completed_at: DateTime.now + 10)
  end

  test 'high priority chore' do
    chore = chores(:one)
    chore.priority = :high_priority

    assert chore.high_priority?
  end

  test "priority score accurately reflects priorities" do
    assert chores(:one).priority_score > chores(:two).priority_score
  end
end
