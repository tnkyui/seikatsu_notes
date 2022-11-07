class TodoListsController < ApplicationController

  def create
    @shopping_lists = current_user.shopping_lists.page(params[:page]).per(10)
    @todo_lists = current_user.todo_lists.order(:start_date).page(params[:page]).per(10)

    @todo_list = TodoList.new(todo_list_params)
    @todo_list.user_id = current_user.id
    if @todo_list.save
      redirect_to request.referer, notice: "リストに登録しました"
    else
      redirect_to request.referer, alert: "入力内容に不備があります"
    end
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
    redirect_to request.referer, notice: "リストを更新しました"
  end

  def destroy
    todo_list = TodoList.find(params[:id])
    todo_list.destroy
    redirect_to request.referer, notice: "リストを削除しました"
  end

  private
    def todo_list_params
      params.require(:todo_list).permit(:name, :start_date, :complete_switch, :repeat_days)
    end

end
