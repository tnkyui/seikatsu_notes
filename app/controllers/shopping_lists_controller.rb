class ShoppingListsController < ApplicationController

  def create
    @shopping_list = ShoppingList.new(shopping_list_params)
    @shopping_list.user_id = current_user.id
    @shopping_list.save
    redirect_to lists_path

  end

  def destroy
    shopping_list = ShoppingList.find(params[:id])
    shopping_list.destroy
    redirect_to lists_path
  end

  private
    def shopping_list_params
      params.require(:shopping_list).permit(:name)
    end

end
