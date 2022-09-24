class ListsController < ApplicationController

  def index
    @user = current_user
    @shopping_list = ShoppingList.new
    @shopping_lists = @user.shopping_lists
    @todo_list = TodoList.new
    @todo_lists = @user.todo_lists.order(:start_date)

    @stock = Stock.new
  end

end
