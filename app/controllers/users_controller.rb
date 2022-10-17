class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
  end

  def destroy
    user = User.find(current_user.id)
    user.destroy
    redirect_to root_path
  end
end
