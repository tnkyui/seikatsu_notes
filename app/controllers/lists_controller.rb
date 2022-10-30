class ListsController < ApplicationController

  def index
    @user = current_user
    @shopping_list = ShoppingList.new
    @shopping_lists = @user.shopping_lists.page(params[:page]).per(10)
    @todo_list = TodoList.new
    @todo_lists = @user.todo_lists.order(:start_date).page(params[:page]).per(10)
  end

end
