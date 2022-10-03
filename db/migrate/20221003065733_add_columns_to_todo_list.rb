class AddColumnsToTodoList < ActiveRecord::Migration[6.1]
  def change
    add_column :todo_lists, :complete_switch, :boolean, default: false, null: false
    add_column :todo_lists, :repeat_days, :integer, default: 0, null: false
  end
end
