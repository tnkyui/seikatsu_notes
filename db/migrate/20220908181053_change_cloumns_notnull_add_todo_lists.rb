class ChangeCloumnsNotnullAddTodoLists < ActiveRecord::Migration[6.1]
  def change
    change_column :todo_lists, :start_date, :date, null: false
  end
end
