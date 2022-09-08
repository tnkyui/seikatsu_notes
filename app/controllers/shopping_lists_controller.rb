class ShoppingListsController < ApplicationController

  def create
    @shopping_list = ShoppingList.new(shopping_list_params)
    @shopping_list.user_id = current_user.id
    @shopping_list.save
    redirect_to lists_path

  end

  def update
  end

  def destroy
  end

  private
    def shopping_list_params
      params.require(:shopping_list).permit(:name)
    end

end
