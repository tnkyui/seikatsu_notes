class ListsController < ApplicationController
  
  def index
    @shopping_list = ShoppingList.new
    @todo_list = TodoList.new
  end

end
