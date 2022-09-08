class TodoListsController < ApplicationController

  def create
    todo_list = TodoList.new(todo_list_params)
    todo_list.save
    redirect_to lists_path
  end

  def update
  end

  def destroy
  end

  private
    def todo_list_params
      params.require(:todo_list).permit(:name, :start_time)
    end

end
