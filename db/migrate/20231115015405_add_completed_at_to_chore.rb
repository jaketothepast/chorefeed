class AddCompletedAtToChore < ActiveRecord::Migration[7.0]
  def change
    add_column :chores, :completed_at, :datetime
  end
end
