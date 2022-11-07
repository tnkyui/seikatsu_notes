class ShoppingListsController < ApplicationController

  def create
    @shopping_lists = current_user.shopping_lists.page(params[:page]).per(10)
    @todo_lists = current_user.todo_lists.order(:start_date).page(params[:page]).per(10)

    @shopping_list = ShoppingList.new(shopping_list_params)
    @shopping_list.user_id = current_user.id
    if @shopping_list.save
      redirect_to lists_path, notice: "リストに登録しました"
    else
      redirect_to lists_path, alert: "入力内容に不備があります"
    end

  end

  def destroy
    shopping_list = ShoppingList.find(params[:id])
    shopping_list.destroy
    redirect_to lists_path, notice: "リストを削除しました"
  end

  private
    def shopping_list_params
      params.require(:shopping_list).permit(:name)
    end

end
