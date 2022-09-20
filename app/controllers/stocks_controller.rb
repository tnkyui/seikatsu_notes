class StocksController < ApplicationController
  def index
    @stock = Stock.new
    @stocks = current_user.stocks.all
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def create
    stock = Stock.new(stock_params)
    stock.user_id = current_user.id
    stock.alert_date = stock.purchase_date.to_time.to_datetime + params[:stock][:alert_setting].to_i
    stock.stock_amount = params[:stock][:stock_amount].to_i - 1
    if params[:stock][:alert_setting] == "0"
      stock.update(alert_switch: "false")
    end
    stock.save
    redirect_to stocks_path
  end

  def update
    stock = Stock.find(params[:id])
    stock.update(stock_params)
    redirect_to stocks_path
  end

  def destroy
  end

  private

  def stock_params
    params.require(:stock).permit(:name, :purchase_date, :percentage, :stock_amount, :alert_date, :alert_switch, :category_id)
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
