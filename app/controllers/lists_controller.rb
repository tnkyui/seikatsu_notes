class ListsController < ApplicationController
  def index
    @shopping_list = ShoppingList.new
    @todo_list = TodoList.new
  end

  def create
    shopping_list = ShoppingList.new(shopping_list_params)
    shopping_list.save
    redirect_to lists_path
    todo_list = TodoList.new(todo_list_params)
    todo_list.save
    redirect_to lists_path
  end

  def update
  end

  def destroy
  end

  private
    def shopping_list_params
      params.require(:shopping_list).permit(:name)
    end

    def todo_list_params
      params.require(:todo_list).permit(:name, :start_time)
    end
end
