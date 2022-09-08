class CategoriesController < ApplicationController

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    @category.save
    redirect_to :back
  end

  def destroy
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end

end
