class CreateChores < ActiveRecord::Migration[7.0]
  def change
    create_table :chores do |t|
      t.string :title
      t.text :desc

      t.timestamps
    end
  end
end
