class TodoListsController < ApplicationController

  def create
    @todo_list = TodoList.new(todo_list_params)
    @todo_list.user_id = current_user.id
    @todo_list.save
    redirect_to request.referer
  end

  def update
    @todo_list = TodoList.find(params[:id])
    if params[:todo_list][:repeat_days] != "0" && params[:todo_list][:complete_switch] == "true"
      repeat_todo_list = TodoList.new
      repeat_todo_list.name = @todo_list.name
      repeat_todo_list.user_id = current_user.id
      repeat_todo_list.start_date = @todo_list.start_date + params[:todo_list][:repeat_days].to_i
      repeat_todo_list.repeat_days = @todo_list.repeat_days
      repeat_todo_list.save
    end
    @todo_list.update(todo_list_params)
    redirect_to request.referer
  end

  def destroy
    todo_list = TodoList.find(params[:id])
    todo_list.destroy
    redirect_to request.referer
  end

  private
    def todo_list_params
      params.require(:todo_list).permit(:name, :start_date, :complete_switch, :repeat_days)
    end

end
