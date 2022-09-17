class HomesController < ApplicationController
  def top
  end

  def index
    user = current_user
    todo_lists = user.todo_lists.all
    stocks = user.stocks.all
    shopping_lists = user.shopping_lists.all
    # 以下カレンダー用
    @events = todo_lists | stocks
    # 以下Add_shopping_list?用
    @stock_add_list = user.stocks.where(percentage: 0..20, stock_amount: 0)
    @shopping_list = ShoppingList.new
    # 以下alert用
    @stock_alert = user.stocks.where(alert_switch: true).where("alert_date <= ?", Date.current)
    # @stock = Stock.find(params[:id])
  end
end
