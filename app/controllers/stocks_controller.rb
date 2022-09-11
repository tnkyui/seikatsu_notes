class StocksController < ApplicationController
  def index
    @stock = Stock.new
    @stocks = Stock.all
    # @stocks = current_user.stocks.all
    @category = Category.new
  end

  def show
    @stock = Stock.find(params[:id])
    @category = Category.new
  end

  def create
    @stock = Stock.new(stock_params)
    @stock.user_id = current_user.id
    @alert_date = params[:stock][:purchase_date].to_time.to_datetime + params[:stock][:alert_date].to_i
    @stock.save
    Stock.create(alert_date: @alert_date)
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
    params.require(:stock).permit(:name, :purchase_date, :percentage, :stock_amount, :alert_date, :category_id)
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
