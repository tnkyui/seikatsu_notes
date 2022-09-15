class HomesController < ApplicationController
  def top
  end

  def index
    user = current_user
    todo_lists = user.todo_lists.all
    stocks = user.stocks.all
    @events = todo_lists | stocks
  end
end
