class UsersController < ApplicationController
  
  def show
    @user = User.find_by(id: params[:id])
    @diaries = Diary.where(user_id: @user.id)
  end
  
  def index
    @users = User.where(user_type: "s") 
  end
end
