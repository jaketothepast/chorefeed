class AddDueDateToChore < ActiveRecord::Migration[7.0]
  def change
    add_column :chores, :due_date, :datetime
  end
end
