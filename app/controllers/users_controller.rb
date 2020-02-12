class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    user = User.find(current_user.id)
     user.update(user_params)
     redirect_to user_path(current_user)
  end

  def withdraw
  end
  def destory
    @user = current_user
    @user.destroy
    redirect_to root_path
  end

  def joining_events
    @user = current_user
    @join_events = @user.join_events.all
  end

  def my_events
    @user = current_user
    @my_events = @user.events.all
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :family_name, :first_name_kana, :family_name_kana, :email, :tel , :profile_image)
  end
end
