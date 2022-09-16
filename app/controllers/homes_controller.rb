class HomesController < ApplicationController
  def top
  end

  def index
    user = current_user
    todo_lists = user.todo_lists.all
    stocks = user.stocks.all
    shopping_lists = user.shopping_lists.all
    @events = todo_lists | stocks
    @stock = user.stocks.where(percentage: 0..20, stock_amount: 0)
    @shopping_list = ShoppingList.new
  end
end
