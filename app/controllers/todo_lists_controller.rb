class TodoListsController < ApplicationController

  def create
    @todo_list = TodoList.new(todo_list_params)
    @todo_list.user_id = current_user.id
    @todo_list.save
    redirect_to request.referer
  end

  def update
    todo_list = TodoList.find(params[:id])
    todo_list.update(todo_list_params)
    redirect_to request.referer
  end

  def destroy
    todo_list = TodoList.find(params[:id])
    todo_list.destroy
    redirect_to request.referer
  end

  private
    def todo_list_params
      params.require(:todo_list).permit(:name, :start_date, :complete_switch)
    end

end
