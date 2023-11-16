class AddPriorityToChore < ActiveRecord::Migration[7.0]
  def change
    add_column :chores, :priority, :integer, default: 0
  end
end
