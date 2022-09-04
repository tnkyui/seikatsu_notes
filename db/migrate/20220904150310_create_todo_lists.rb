class CreateTodoLists < ActiveRecord::Migration[6.1]
  def change
    create_table :todo_lists do |t|
      t.string :name,         null: false
      t.integer :user_id,     null: false
      t.datetime :start_time, null: false

      t.timestamps
    end
  end
end
