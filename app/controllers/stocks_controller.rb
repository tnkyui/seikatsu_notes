class StocksController < ApplicationController
  def index
    @stock = Stock.new
    @category = Category.new
  end

  def show
    @stock = Stock.find(params[:id])
    @category = Category.new
  end

  def create
    stock = Stock.new(stock_params)
    stock.save
    if params[:stock][:category_id] == 0
      @category = Category.new(category_params)
      @category.user_id = current_user.id
      @category.save
      stock.update(category_id: @category.id)
    end
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
    params.require(:stock).permit(:name, :purchase_date, :percentage, :stock_amount, :alert_date)
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
