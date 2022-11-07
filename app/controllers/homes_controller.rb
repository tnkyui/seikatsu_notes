class HomesController < ApplicationController
  def top
  end

  def index
    user = current_user
    @todo_lists = user.todo_lists.all
    @stocks = user.stocks.where(alert_switch: true)
    shopping_lists = user.shopping_lists.all
    # 以下カレンダー用
    @events = @todo_lists | @stocks
    # 以下Add_shopping_list?用
    stock_add_list = user.stocks.where(percentage: 0..20, stock_amount: 0, hidden_switch: true).pluck(:name)
    @stock_add_list = stock_add_list - shopping_lists.pluck(:name) #かうものリストと重複するものは省く
      @stock_add_list.each do |stock|
        @stock_id = user.stocks.where(name: stock) #link用に配列からデータを再度引っ張る
      end
    @shopping_list = ShoppingList.new #Addボタン用
    # 以下alert用
    @stock_alert = user.stocks.where(alert_switch: true).where("alert_date <= ?", DateTime.current)
  end
end
