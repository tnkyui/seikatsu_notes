class StocksController < ApplicationController
  def index
    @stock = Stock.new
    @category = Category.new
  end

  def show
  end

  def create
    stock = Stock.new(stock_params)
    stock.save
    redirect_to stocks_path
  end

  def update
  end

  def destroy
  end

  private

  def stock_params
    params.require(:stock).permit(:name, :purchase_date, :percentage, :stock_amount, :alert_date)
  end
end
