class ListsController < ApplicationController

  def index
    @shopping_list = ShoppingList.new
    @user = current_user
    @shopping_lists = @user.shopping_lists
    # @shopping_lists = ShoppingList.all
    @todo_list = TodoList.new
  end

end
