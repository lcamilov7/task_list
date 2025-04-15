class AddDoneAtToTasks < ActiveRecord::Migration[7.2]
  def change
    add_column :tasks, :done_at, :datetime, null: true
  end
end
