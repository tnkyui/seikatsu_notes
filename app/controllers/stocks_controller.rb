class StocksController < ApplicationController
  def index
    @stock = Stock.new
    @stocks = current_user.stocks.all
    @stock_meats_fish = @stocks.where(category: 0)
    @stock_vegetables = @stocks.where(category: 1)
    @stock_spices = @stocks.where(category: 2)
    @stock_drink = @stocks.where(category: 3)
    @stock_other_food = @stocks.where(category: 30)
    @stock_kitchen_tools = @stocks.where(category: 40)
    @stock_cleaning = @stocks.where(category: 50)
    @stock_beauty = @stocks.where(category: 60)
    @stock_daily_necessities = @stocks.where(category: 70)
    @stock_other = @stocks.where(category: 98)
    @stock_not_set = @stocks.where(category: 99)
    @shopping_list = ShoppingList.new
    # 以下リストへ追加ボタン
    @shopping_list_name = current_user.shopping_lists.pluck(:name)
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def create
    stock = Stock.new(stock_params)
    stock.user_id = current_user.id
    in_stock = current_user.stocks.find_by(name: params[:stock][:name])
    if in_stock.present?  #もしｽﾄｯｸに同じ名称の在庫があったら
      in_stock.stock_amount += params[:stock][:stock_amount].to_i
      in_stock.purchase_date = params[:stock][:purchase_date]
      in_stock.category = params[:stock][:category]
      in_stock.alert_date = in_stock.purchase_date.to_time.to_datetime + params[:stock][:alert_setting].to_i
        if params[:stock][:alert_setting] == "0"
          in_stock.update(alert_switch: "false")
        end
      in_stock.save
      redirect_to stock_path(in_stock.id)
    elsif stock.alert_date = stock.purchase_date.to_time.to_datetime + params[:stock][:alert_setting].to_i
      # stock.category = params[:stock][:category].values
      stock.stock_amount = params[:stock][:stock_amount].to_i - 1
        if params[:stock][:alert_setting] == "0"
          stock.update(alert_switch: "false")
        end
      stock.save
      redirect_to stocks_path
    end
  end

  def update
    stock = Stock.find(params[:id])
    stock.update(stock_params)
    redirect_to stocks_path
  end

  def destroy
    stock = Stock.find(params[:id])
    stock.destroy
    redirect_to stocks_path
  end

  private

  def stock_params
    params.require(:stock).permit(:name, :purchase_date, :percentage, :stock_amount, :alert_date, :alert_switch, :hidden_switch, :category)
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
