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
    assert chore.save, "Saved the chore without a title"
  end
end
