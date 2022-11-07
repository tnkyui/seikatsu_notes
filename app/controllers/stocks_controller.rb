class StocksController < ApplicationController
  def index
    @stock = Stock.new
    @stocks           = current_user.stocks.order(:stock_amount, :percentage).page(params[:stocks_page]).per(10)
    @stock_meats_fish = @stocks.where(category: 0).order(:stock_amount, :percentage).page(params[:meats_fish_page]).per(10)
    @stock_vegetables = @stocks.where(category: 1).order(:stock_amount, :percentage).page(params[:vegetables_page]).per(10)
    @stock_spices     = @stocks.where(category: 2).order(:stock_amount, :percentage).page(params[:spices_page]).per(10)
    @stock_drink      = @stocks.where(category: 3).order(:stock_amount, :percentage).page(params[:drink_page]).per(10)
    @stock_other_food = @stocks.where(category: 30).order(:stock_amount, :percentage).page(params[:other_food_page]).per(10)
    @stock_kitchen_tools = @stocks.where(category: 40).order(:stock_amount, :percentage).page(params[:kitchen_tools_page]).per(10)
    @stock_cleaning   = @stocks.where(category: 50).order(:stock_amount, :percentage).page(params[:cleaning_page]).per(10)
    @stock_beauty     = @stocks.where(category: 60).order(:stock_amount, :percentage).page(params[:beauty_page]).per(10)
    @stock_daily_necessities = @stocks.where(category: 70).order(:stock_amount, :percentage).page(params[:daily_necessities_page]).per(10)
    @stock_other      = @stocks.where(category: 98).order(:stock_amount, :percentage).page(params[:other_page]).per(10)
    @stock_not_set    = @stocks.where(category: 99).order(:stock_amount, :percentage).page(params[:not_set_page]).per(10)
    @shopping_list    = ShoppingList.new
    # 以下リストへ追加ボタン
    @shopping_list_name = current_user.shopping_lists.pluck(:name)
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def create
    # 以下render用のindexのコピー
    @stocks           = current_user.stocks.order(:stock_amount, :percentage).page(params[:stocks_page]).per(10)
    @stock_meats_fish = @stocks.where(category: 0).order(:stock_amount, :percentage).page(params[:meats_fish_page]).per(10)
    @stock_vegetables = @stocks.where(category: 1).order(:stock_amount, :percentage).page(params[:vegetables_page]).per(10)
    @stock_spices     = @stocks.where(category: 2).order(:stock_amount, :percentage).page(params[:spices_page]).per(10)
    @stock_drink      = @stocks.where(category: 3).order(:stock_amount, :percentage).page(params[:drink_page]).per(10)
    @stock_other_food = @stocks.where(category: 30).order(:stock_amount, :percentage).page(params[:other_food_page]).per(10)
    @stock_kitchen_tools = @stocks.where(category: 40).order(:stock_amount, :percentage).page(params[:kitchen_tools_page]).per(10)
    @stock_cleaning   = @stocks.where(category: 50).order(:stock_amount, :percentage).page(params[:cleaning_page]).per(10)
    @stock_beauty     = @stocks.where(category: 60).order(:stock_amount, :percentage).page(params[:beauty_page]).per(10)
    @stock_daily_necessities = @stocks.where(category: 70).order(:stock_amount, :percentage).page(params[:daily_necessities_page]).per(10)
    @stock_other      = @stocks.where(category: 98).order(:stock_amount, :percentage).page(params[:other_page]).per(10)
    @stock_not_set    = @stocks.where(category: 99).order(:stock_amount, :percentage).page(params[:not_set_page]).per(10)
    @shopping_list_name = current_user.shopping_lists.pluck(:name)

    @stock = Stock.new(stock_params)
    @stock.user_id = current_user.id
    in_list = current_user.shopping_lists.find_by(name: params[:stock][:name])
    in_stock = current_user.stocks.find_by(name: params[:stock][:name])
    if in_stock.present?  #もしｽﾄｯｸに同じ名称の在庫があったら
      in_stock.add_stock(params[:stock][:stock_amount], params[:stock][:purchase_date],
                          params[:stock][:category], params[:stock][:alert_setting])
        if in_stock.save && in_list.present?  #もし買い物リストに既にあるものを購入したら
            in_list.destroy
            redirect_to stock_path(in_stock.id), notice: "在庫とリストを更新しました"
        elsif in_stock.save && !in_list.present?
            redirect_to stock_path(in_stock.id), notice: "在庫を更新しました"
        else
          render :index
        end
    else
      @stock.new_stock(params[:stock][:stock_amount], params[:stock][:alert_setting])
        if @stock.save && in_list.present?  #もし買い物リストに既にあるものを購入したら
            in_list.destroy
            redirect_to stocks_path, notice: "在庫とリストを更新しました"
        elsif @stock.save && !in_list.present?
            redirect_to stocks_path, notice: "在庫を登録しました"
        else
          render :index
        end
    end
  end

  def update
    stock = Stock.find(params[:id])
    stock.update(stock_params)
    if params[:stock][:hidden_switch] == "false"
      redirect_to home_path, notice: "在庫を更新しました"
    else
      redirect_to stocks_path, notice: "在庫を更新しました"
    end
  end

  def destroy
    stock = Stock.find(params[:id])
    stock.destroy
    redirect_to stocks_path, notice: "在庫を削除しました"
  end

  private

  def stock_params
    params.require(:stock).permit(:name, :purchase_date, :percentage, :stock_amount, :alert_date, :alert_switch, :hidden_switch, :category)
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
