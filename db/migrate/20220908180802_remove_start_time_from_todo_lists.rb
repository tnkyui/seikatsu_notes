class RemoveStartTimeFromTodoLists < ActiveRecord::Migration[6.1]
  def change
    remove_column :todo_lists, :start_time, :datetime
  end
end
