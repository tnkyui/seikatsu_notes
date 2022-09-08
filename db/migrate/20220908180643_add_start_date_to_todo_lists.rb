class AddStartDateToTodoLists < ActiveRecord::Migration[6.1]
  def change
    add_column :todo_lists, :start_date, :date
  end
end
