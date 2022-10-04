class TodoListsController < ApplicationController

  def create
    @todo_list = TodoList.new(todo_list_params)
    @todo_list.user_id = current_user.id
    @todo_list.save
    redirect_to lists_path
  end

  def update
    todo_list = TodoList.find(params[:id])
    todo_list.update
    redirect_to lists_path
  end

  def destroy
    todo_list = TodoList.find(params[:id])
    todo_list.destroy
    redirect_to lists_path
  end

  private
    def todo_list_params
      params.require(:todo_list).permit(:name, :start_date)
    end

end
